#!/usr/bin/env python3
"""Footprint comparison for the frozen radial kinetic functional."""

import argparse
import json
import math
from fractions import Fraction
from pathlib import Path

import numpy as np

from cuff_length_certificate import (
    Interval, add, absolute_square, complex_scale, multiply, pole_field, powers,
    reciprocal,
)
from native_harmonic_measures import validated_potential


def add_polynomial(a, b):
    result = a + [Fraction(0)] * max(0, len(b) - len(a))
    for i, value in enumerate(b):
        result[i] += value
    return result


def chebyshev_polynomials(degree):
    """Exact monomial coefficients of T_j(2s-1)."""
    polynomials = [[Fraction(1)], [Fraction(-1), Fraction(2)]]
    for _ in range(2, degree + 1):
        previous = polynomials[-1]
        part = [-2*x for x in previous] + [Fraction(0)]
        for k, x in enumerate(previous):
            part[k+1] += 4*x
        polynomials.append(add_polynomial(part, [-x for x in polynomials[-2]]))
    return polynomials[:degree + 1]


def bernstein_derivative(polynomial, end):
    """Range bound of the derivative on [0,end] in the Bernstein basis."""
    degree = len(polynomial)-2
    powers_scaled = [(j+1)*polynomial[j+1]*end**j for j in range(degree+1)]
    bernstein = [sum(Fraction(math.comb(i,j),math.comb(degree,j))*powers_scaled[j]
                     for j in range(i+1)) for i in range(degree+1)]
    return Interval.rational(max(map(abs, bernstein)))


def radial_polynomials(data, ceiling=Fraction(9, 32)):
    modes, degree = data["modes"], data["degree"]
    chebyshev = chebyshev_polynomials(degree)
    rows = [[Fraction(float.fromhex(a)), *[Fraction(float.fromhex(x)) for x in b]]
            for a,b in zip(data["coefficients"], data["response"])]
    charts = []
    offset = 0
    for frequencies in [range(0,modes+1,2), range(modes+1)]:
        groups = []
        for k in frequencies:
            terms = []
            for col in range(3):
                polynomial = [Fraction(0)]*(degree+1)
                for j in range(degree+1):
                    polynomial = add_polynomial(polynomial, [x*rows[offset+j][col] for x in chebyshev[j]])
                terms.append(([Interval.rational(x) for x in polynomial],
                              bernstein_derivative(polynomial,ceiling)))
            groups.append((k, terms))
            offset += degree+1
        charts.append(groups)
    assert offset == len(rows)
    return charts


def evaluate_radial(polynomial, derivative_bound, r2):
    midpoint = (r2.lo+r2.hi)/2
    centered = Interval(midpoint)
    offset = r2-centered
    radius = np.maximum(abs(offset.lo), abs(offset.hi))
    value = polynomial[-1]
    for coefficient in reversed(polynomial[:-1]):
        value = value*centered+coefficient
    error = derivative_bound*Interval(radius)
    return value+Interval(-error.hi,error.hi)


def scalar_fields(z, charts, right_distance=None, ceiling=9/32):
    y0 = complex_scale(z,.25)
    y_right = complex_scale(reciprocal((z[0]-1,z[1])),.25)
    y_left = complex_scale(reciprocal((z[0]+1,z[1])),.25)
    coordinates = [y0,y_right,y_left]
    right_radius = (absolute_square(y_right) if right_distance is None else
                    (Interval(.25)/right_distance).square())
    radii = [absolute_square(y0), right_radius, absolute_square(y_left)]
    values = [Interval(0) for _ in range(3)]
    for i,(y,r2) in enumerate(zip(coordinates,radii)):
        r2 = Interval(np.maximum(r2.lo,0),r2.hi)
        assert np.all(r2.hi < ceiling)
        modes = charts[0 if i == 0 else 1]
        yp = powers(y,modes[-1][0])
        for k,terms in modes:
            sign = (-1)**k if i==2 else 1
            angular = yp[k][0]*sign
            for col,(poly,der) in enumerate(terms):
                values[col] += angular*evaluate_radial(poly,der,r2)
    z2 = multiply(z,z)
    values[0] += absolute_square(z)/64-.75*absolute_square((z2[0]-1,z2[1])).log()
    return values


def hopf_fields(z, multipoles):
    fields = []
    for parity, coefficients in multipoles:
        direct = pole_field(z,coefficients)
        reflected = pole_field(complex_scale(z,-1),coefficients)
        p = add(direct,complex_scale(reflected,-parity))
        # Return the squared holomorphic coefficient and the upper bound of its norm.
        fields.append((multiply(p,p),absolute_square(p)))
    return fields


def magnitude(z):
    square = absolute_square(z)
    return Interval(np.maximum(square.lo,0),square.hi).elementary("sqrt")


def marking_box_values(z, values, multipoles, parameters):
    v, va, vb = values
    p, q = hopf_fields(z, multipoles)
    phi = add(complex_scale(p[0], parameters[0]), complex_scale(q[0], parameters[1]))
    # Exact parameter radii and the true-basis error over the planar pants.
    a = Interval.rational(Fraction(1,50000))
    b = Interval.rational(Fraction(1,20000))
    affine_error = (a*Interval(np.maximum(abs(va.lo),abs(va.hi)))
                    + b*Interval(np.maximum(abs(vb.lo),abs(vb.hi))))
    dphi = a*p[1]+b*q[1]+Interval.rational(Fraction(2,10**10))
    return v, phi, affine_error, dphi


def footprint_batch(rho,t,quadrant,charts,multipoles,parameters):
    t2=t.square()
    w=((1-t2)/(1+t2),2*t/(1+t2))
    if quadrant:
        w=-w[1],w[0]
    z=add((Interval(1),Interval(0)),complex_scale(w,rho))
    v,phi,affine_error,dphi=marking_box_values(
        z,scalar_fields(z,charts,right_distance=rho),multipoles,parameters)
    hi=v.exp()
    normalized=magnitude(phi)/hi
    assert np.all(normalized.hi<1), "footprint intervals are too wide"
    responses = []
    for tolerance in (126, 193):
        dv=affine_error+Interval.rational(Fraction(tolerance,10**6))
        half=(dv/2).exp()
        sinh_two=half-Interval(1)/half
        epsilon=half-1+sinh_two*normalized/(1-normalized)+half*dphi/(hi*(1-normalized))
        responses.append((epsilon.hi.max(),dv.hi.max()))
    return normalized.hi.max(), (v.lo.min(),v.hi.max()), responses


def moving_metrics(z, charts, multipoles, parameters, tolerance):
    v, phi, affine_error, dphi = marking_box_values(
        z,scalar_fields(z,charts,ceiling=5/16),multipoles,parameters)
    du = affine_error+Interval.rational(Fraction(tolerance,10**6))
    height = (v+Interval(-du.hi,du.hi)).exp()
    absolute_phi = magnitude(phi)+Interval(-dphi.hi,dphi.hi)
    absolute_phi = Interval(np.maximum(0,absolute_phi.lo),absolute_phi.hi)
    ratio = absolute_phi/height
    assert np.all(ratio.hi<1)
    jacobian = height-absolute_phi.square()/height
    relative_inverse = (1+ratio)/(1-ratio)
    return jacobian, relative_inverse


def uniform_cells(start, stop, count):
    ticks = [Interval.rational(start+(stop-start)*Fraction(i,count)) for i in range(count+1)]
    return Interval(np.array([tick.lo for tick in ticks[:-1]]),
                    np.array([tick.hi for tick in ticks[1:]]))


def moving_rectangle(data, multipoles, parameters, count):
    """Enclose the disk via [9/5,11/5] x [-1/5,1/5] and conjugation."""
    charts = radial_polynomials(data, ceiling=Fraction(5,16))
    x = uniform_cells(Fraction(9,5),Fraction(11,5),count)
    y = uniform_cells(Fraction(0),Fraction(1,5),count)
    # A conservative height gate, also covering the sharper isolated-root tape.
    tolerance = 193
    jacobian, relative_inverse = moving_metrics(
        (Interval(x.lo[:,None],x.hi[:,None]),Interval(y.lo[None,:],y.hi[None,:])),
        charts,multipoles,parameters,tolerance)
    jacobian_max = float(jacobian.hi.max())
    inverse_max = float(relative_inverse.hi.max())
    print("upper rectangle J and lambda_max(J q^-1):",jacobian_max,inverse_max)
    assert jacobian_max < Interval.rational(Fraction(7,25)).lo
    assert inverse_max < 3.5
    disk_edge, _ = moving_metrics(
        (Interval.rational(Fraction(9,5)),Interval(0)),charts,multipoles,parameters,tolerance)
    print("J at (9/5,0):",disk_edge)
    assert disk_edge.lo > Interval.rational(Fraction(6,25)).hi


def early_subinterval(metric_upper):
    """Bound K on [27/400, 3/32] from the Schur complement."""
    r = Fraction(35,32)
    e = Interval.rational(r).exp()
    assert ((e-Interval(1)/e)/2).hi < 1.5
    normalization = r*r*(1+metric_upper/Fraction(256))**2
    schur = Fraction(5,2)+metric_upper*Fraction(35**2,4)
    square_bound = Interval.rational(normalization**2*schur)
    density = square_bound.elementary("sqrt")
    volume_weight = Interval.rational(6*80*Fraction(21,800)*Fraction(4,125)**2)
    return density*volume_weight


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--radial",type=int,default=16)
    parser.add_argument("--angle",type=int,default=256)
    parser.add_argument("--moving-rectangle", action="store_true",
                        help="enclose coefficients on the localized exterior support")
    parser.add_argument("--rectangle-cells", type=int, default=64)
    args=parser.parse_args()
    if args.rectangle_cells < 1:
        parser.error("rectangle-cells must be positive")
    for count in (args.radial,args.angle):
        assert count>0 and count&(count-1)==0, "use dyadic partitions"
    data=json.loads(Path(__file__).with_name("whole_pants_residual_d18.json").read_text())
    parameters=[float.fromhex(x) for x in data["parameters"]]
    multipoles=[(parity,[Interval.rational(x) for x in validated_potential(parity)[0]]) for parity in (1,-1)]
    if args.moving_rectangle:
        moving_rectangle(data,multipoles,parameters,args.rectangle_cells)
        return
    charts=radial_polynomials(data)
    grid=np.linspace(119/128,137/128,args.radial+1)
    tick=np.arange(args.angle+1)/args.angle
    max_kappa=0
    max_epsilon=np.zeros(2)
    max_dv=np.zeros(2)
    v_min,v_max=float("inf"),float("-inf")
    for quadrant in (0,1):
        for j in range(args.radial):
            rho=Interval(grid[j],grid[j+1])
            t=Interval(tick[:-1],tick[1:])
            kappa,values,responses=footprint_batch(rho,t,quadrant,charts,multipoles,parameters)
            max_kappa=max(max_kappa,kappa)
            epsilons,errors=np.asarray(responses).T
            max_epsilon=np.maximum(max_epsilon,epsilons)
            max_dv=np.maximum(max_dv,errors)
            v_min,v_max=min(v_min,values[0]),max(v_max,values[1])
    print("enclosed upper normalized Hopf coefficient", max_kappa)
    print("enclosed scalar range", (v_min,v_max))
    for tolerance,epsilon,error in zip((126,193),max_epsilon,max_dv):
        m=Interval(1)/(1-Interval(epsilon)).square()
        print("scalar tolerance, full height error, relative differential error",tolerance,error,epsilon)
        print("certified kinetic comparison factor",m)
        assert m.hi < 1.01
        assert (m*Interval(v_max).exp()*(1+Interval(max_kappa)).square()).hi < 3
    conditional = early_subinterval(Fraction(3))
    unconditional = early_subinterval(Fraction(28))
    print("subinterval K upper, conditional and unconditional:",conditional.hi,unconditional.hi)
    assert conditional.hi < .5 and unconditional.hi < 1.8


if __name__=="__main__":
    main()

