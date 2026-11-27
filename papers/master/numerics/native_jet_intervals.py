"""Two native first-jet enclosures from the whole-pants residual certificate.

A parameter-box uniform relative residual <= 1/8000, with the independently
validated flux and length margins, gives |u-v| < 0.000126 and |∇u-∇v| < 0.0022
on the footprints (see the master receipt). This script verifies the ensuing
anchor intervals. It does not assume the FEM field or use its nodal values.
"""
from fractions import Fraction as Q
from math import factorial, isqrt
from pathlib import Path
import json

from native_harmonic_measures import anchor_enclosures, validated_potential


def add(a, b):
    return a[0]+b[0], a[1]+b[1]


def times(a, b):
    ends = [x*y for x in a for y in b]
    return min(ends), max(ends)


def point(x):
    return x, x


def negate(a):
    return -a[1], -a[0]


def inverse(a):
    assert a[0] > 0
    return 1/a[1], 1/a[0]


def exponential(x):
    # All arguments called below are real and have magnitude below 2.
    if x < 0:
        return inverse(exponential(-x))
    assert x < 2
    subtotal = sum(x**k/factorial(k) for k in range(21))
    return subtotal, subtotal + x**21/factorial(21)/(1-x/22)


def chebyshev_row(t, degree):
    vals, derivs = [Q(1), t], [Q(0), Q(1)]
    for _ in range(2, degree+1):
        derivs.append(2*vals[-1]+2*t*derivs[-1]-derivs[-2])
        vals.append(2*t*vals[-1]-vals[-2])
    return vals, derivs


def native_comparator(z, data, widths):
    """Rational part of v (excluding its log) and the full native x derivative."""
    columns = [[], []]
    for center, modes in [(0, range(0, 21, 2)), (1, range(21)), (-1, range(21))]:
        y = z/4 if center == 0 else 1/(4*(z-center))
        dy = Q(1,4) if center == 0 else -1/(4*(z-center)**2)
        vals, derivs = chebyshev_row(2*y*y-1, 18)
        for k in modes:
            for j in range(19):
                phase = (-1)**k if center == -1 else 1
                v = y**k*vals[j]
                dx = dy * ((k*y**(k-1)*vals[j] if k else 0) + 4*y**(k+1)*derivs[j])
                if center == -1:
                    idx = (11+k)*19+j
                    columns[0][idx] += phase*v
                    columns[1][idx] += phase*dx
                else:
                    columns[0].append(v)
                    columns[1].append(dx)
    results = []
    coefficient = [Q.from_float(float.fromhex(x)) for x in data['coefficients']]
    response = [[Q.from_float(float.fromhex(x)) for x in row] for row in data['response']]
    for base, col in zip([z*z/64, z/32-3*z/(z*z-1)], columns):
        center_value = base + sum(x*y for x, y in zip(col, coefficient))
        margin = sum(width * abs(sum(x*y[i] for x,y in zip(col,response)))
                     for i,width in enumerate(widths))
        results.append((center_value-margin, center_value+margin))
    return results


def check():
    data = json.loads(Path(__file__).with_name('whole_pants_residual_d18.json').read_text())
    widths = [Q(2, 10**5), Q(5, 10**5)]
    p = [Q.from_float(float.fromhex(x)) for x in data['parameters']]
    parameters = [(x-w,x+w) for x,w in zip(p,widths)]
    fields = []
    for sign in (1, -1):
        coefficients, _, error = validated_potential(sign)
        fields.append(anchor_enclosures(sign, coefficients, error))
    # On the radius-1/8 disk E is below 43; use the Poisson gradient bound.
    S = Q(126, 10**6)
    eta = Q(1, 8000)
    r = Q(1, 8)
    assert 2*Q(127,50)**2/(Q(87,128)-r)**2 < 43
    upper_gradient = 4*S/(Q("3.14")*r) + (2*r/3)*43*(S+eta)/(1-S)
    assert upper_gradient < Q(".0022")
    for i,z in enumerate([Q(0),Q(2)]):
        phi, derivative = point(Q(0)), point(Q(0))
        for anchors, par in zip(fields, parameters):
            pl,ph,dl,dh = anchors[i]
            P, dP = (pl,ph), (dl,dh)
            phi = add(phi,times(par,times(P,P)))
            derivative = add(derivative,times(point(2),times(par,times(P,dP))))
        v, vx = native_comparator(z, data, widths)
        num = exponential(v[0]-S)[0], exponential(v[1]+S)[1]
        modulus = abs(z*z-1)
        n = isqrt(int(modulus)*10**32)
        sqrt_modulus = Q(n,10**16), Q(n+1,10**16)
        H = times(num, inverse(times(point(modulus),sqrt_modulus)))
        low = times(times(phi,phi),inverse(H))
        D = add(H,low)
        J = add(H,negate(low))
        twice_phi = times(point(2),phi)
        xx, yy = add(D,twice_phi), add(D,negate(twice_phi))
        assert xx[0] > 0 and yy[0] > 0 and J[0] > 0
        values = [('q_xx',xx),('q_yy',yy)]
        if z:
            ux = vx[0]-upper_gradient, vx[1]+upper_gradient
            Dx = add(times(J,ux),times(times(twice_phi,derivative),inverse(H)))
            dp = times(point(2),derivative)
            values += [('dx q_xx',add(Dx,dp)),('dx q_yy',add(Dx,negate(dp))),('dy q_xy',negate(dp))]
        print('Native anchor', z)
        for name,bounds in values:
            a,b = bounds
            lo = (10**5*a).__floor__()
            hi = (10**5*b).__ceil__()
            print(f'  {name}: [{lo/1e5:.5f}, {hi/1e5:.5f}]')


if __name__ == '__main__':
    check()
