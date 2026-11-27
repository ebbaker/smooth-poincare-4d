"""Validate the native scalar residual on both cuff-adjacent half annuli.

This is a bounded part of the whole-pants test. Samples use outward basic
binary64 arithmetic. Exact rational analytic bounds control interpolation
between samples on each polar patch.
"""
import argparse
from concurrent.futures import ProcessPoolExecutor
from functools import lru_cache
import json
from pathlib import Path
from fractions import Fraction as Q
import numpy as np
from interior_residual_certificate import (
    Interval, PARAMETER_RADII, absolute, cos_nodes, hole_gradient, interval,
    inverse, norm_square, pair_add, pair_scale, product, radial_chart,
    validated_potential,
)

DATA = json.loads(Path(__file__).with_name('whole_pants_residual_d18.json').read_text())
RAW = np.array([float.fromhex(x) for x in DATA['coefficients']]).reshape(32, 19)
RESPONSE = np.array([[float.fromhex(v) for v in row] for row in DATA['response']]).reshape(32, 19, 2)
PAR = [interval(Q.from_float(float.fromhex(x))) for x in DATA['parameters']]

@lru_cache(None)
def patch_set(nr=4, nt=8):
    levels = (Q(625,961), Q(1), Q(1,4), Q(1,9), Q(32,119)**2)
    strips = [(levels[0], levels[1]), (levels[2], levels[0]),
              (levels[3], levels[2]), (levels[4], levels[3])]
    return [(s, lo+(hi-lo)*i/nr, lo+(hi-lo)*(i+1)/nr, Q(j,nt), Q(j+1,nt))
            for lo,hi in strips for s in (1,-1) for i in range(nr) for j in range(nt)]

@lru_cache(None)
def nodes(stages):
    a=cos_nodes(stages,positive=False)
    return Interval(np.asarray([v.lo for v in a]),np.asarray([v.hi for v in a]))

def shape(a,in_axis):
    return Interval(a.lo[:,None] if in_axis else a.lo[None,:], a.hi[:,None] if in_axis else a.hi[None,:])

def samples(tile, stages=7):
    sign, sa,sb,ta,tb=tile
    ss=shape(interval((sa+sb)/2)+interval((sb-sa)/2)*nodes(stages),True)
    ts=shape(interval((ta+tb)/2)+interval((tb-ta)/2)*nodes(stages),False)
    root=ss.sqrt()
    cs=sign*(1-ts*ts)/(1+ts*ts); sn=2*ts/(1+ts*ts)
    z = (1+cs/(4*root),sn/(4*root))
    charts=[(pair_scale(z,.25),interval(.0625)), (pair_scale((cs,-sn),root),16*ss*ss)]
    y=pair_scale(inverse((z[0]+1,z[1])),.25)
    r=norm_square(y); charts.append((y,16*r*r))

    def field(rows):
        a,da=radial_chart(*charts[0],rows[:11],range(0,21,2))
        b,db=radial_chart(*charts[1],rows[11:],range(21))
        left=rows[11:] * (-1)**np.arange(21)[:,None]
        c,dc=radial_chart(*charts[2],left,range(21))
        return a+b+c,da+db+dc

    val,lap=field(RAW)
    variation=[field(RESPONSE[:,:,j]) for j in range(2)]
    Ropp=norm_square((z[0]+1,z[1])).sqrt()
    q=Ropp/(4*root)
    high=(val+norm_square(z)/64).exp()/(q*q.sqrt())
    fields=[]; phi=(interval(0),interval(0))
    for parity,parameter in zip((1,-1),PAR):
        coeff,_,_=validated_potential(parity)
        g=pair_add(hole_gradient(z,coeff),pair_scale(hole_gradient(pair_scale(z,-1),coeff),-parity))
        fields.append(product(g,g)); phi=pair_add(phi,pair_scale(fields[-1],parameter))
    low=norm_square(phi)/high
    residual=.0625+lap-2*(high-low)
    lin=interval(0); w=interval(0); psi=interval(0)
    for radius,F,(dv,dlap) in zip(PARAMETER_RADII,fields,variation):
        a=interval(radius)
        diff=dlap-2*(high+low)*dv+4*(phi[0]*F[0]+phi[1]*F[1])/high
        lin+=a*absolute(diff)
        w+=a*absolute(dv)
        psi+=a*(absolute(F[0])+absolute(F[1]))
    exp_w=w.exp()
    k=absolute(phi[0])+absolute(phi[1])+psi
    remainder=((high+k*k/high)*w*w+(2*psi*psi+4*k*psi*w)/high)*exp_w
    mr=np.max((absolute(residual)+lin+remainder).hi)
    delta=exp_w*((2*(absolute(phi[0])+absolute(phi[1]))+psi)*psi)/high
    lo=np.min((high/exp_w+low/exp_w-delta).lo)
    hi=np.max((high*exp_w+low*exp_w+delta).hi)
    high_lo = np.min((high/exp_w).lo)
    high_hi = np.max((high*exp_w).hi)
    return tuple(Q.from_float(float(q)) for q in (mr,lo,hi,high_lo,high_hi))

def cert(tile,stages=7):
    r, lo, hi, high_lo, high_hi = samples(tile, stages)
    inner = tile[1] >= Q(625, 961)
    cutoff, majorant = 43, Q(20000 if inner else 200000)
    reaction_bound = 256 + 36 * 55 if inner else 404 * (8 + 36 * 6)
    high_bound = 256 if inner else 404 * 8
    assert reaction_bound + abs((lo + hi)/2) < majorant
    assert high_bound + abs((high_lo + high_hi)/2) < majorant
    tail = 32 * majorant / 2**(cutoff + 1)
    factor = (1 - (Q(22, 7)*cutoff/(2*(1 << stages)))**2/2)**-2
    upper_residual = factor*(r + tail) + tail
    lower_reaction = (lo + hi)/2 - factor*((hi - lo)/2 + tail) - tail
    lower_high = (high_lo + high_hi)/2 - factor*((high_hi - high_lo)/2 + tail) - tail
    if min(lower_reaction, lower_high) <= 0:
        return Q(1)
    # Hopf truncation uses the true |Phi-Phi_app| and the normed lower H.
    eps = Q('2e-10')
    error = eps*(12 + eps)/lower_high
    if lower_reaction <= error:
        return Q(1)
    return (upper_residual + 2*error + Q(2, 3)*Q('2e-9')) / (2*(lower_reaction - error))

def taylor_chebyshev(center):
    """Exact Taylor coefficients of T_j(2s-1) in s-center."""
    rows = [[Q(1)], [2*center-1, Q(2)]]
    for j in range(2, 19):
        polynomial = [Q(0)] * (j + 1)
        for k, value in enumerate(rows[-1]):
            polynomial[k] += 2*(2*center-1)*value
            polynomial[k+1] += 4*value
        for k, value in enumerate(rows[-2]):
            polynomial[k] -= value
        rows.append(polynomial)
    return rows


def right_chart_enclosure(coefficients, center, radius, angular):
    basis = taylor_chebyshev(center)
    totals = [Q(0), Q(0), Q(0)]
    for mode in range(21):
        offset = 19 * (11 + mode)
        row = coefficients[offset:offset+19]
        for k in range(19):
            columns = [sum(row[j][c]*basis[j][k] for j in range(k, 19))
                       for c in range(3)]
            magnitude = abs(columns[0]) + sum(r*abs(v) for r, v in
                                               zip(PARAMETER_RADII, columns[1:]))
            weighted = angular**mode * magnitude
            totals[0] += weighted * radius**k
            if k >= 1:
                totals[1] += k * weighted * radius**(k-1)
            if k >= 2:
                totals[2] += k * (k-1) * weighted * radius**(k-2)
    return totals


def analytic_majorant():
    """Replay constants on the rho=2 complex Bernstein patch products."""
    coefficients = [tuple(Q.from_float(float.fromhex(a)) for a in row)
                    for row in zip(DATA['coefficients'], *(zip(*DATA['response'])))]
    absolute_rows = [abs(a) + sum(r*abs(v) for r,v in zip(PARAMETER_RADII, (b,c)))
                     for a,b,c in coefficients]

    def ellipse_sum(angular, rho, modes):
        return sum(angular**(2*i if i<11 else i-11) * sum(
            rho**j * absolute_rows[19*i+j] for j in range(19)) for i in modes)

    assert ellipse_sum(Q('.34'),Q(5,3),range(11)) < Q('1.58')
    assert ellipse_sum(Q('.152'),Q(5,3),range(11,32)) < Q('1.19')
    assert ellipse_sum(Q('.34'),Q(2),range(11)) < 5
    assert ellipse_sum(Q('.152'),Q(2),range(11,32)) < 2
    minimum_s, maximum_s = Q(1), Q(0)
    for _, a,b,_,_ in patch_set()[::8][:4]:
        center, radius = (a+b)/2, Q(5,8)*(b-a)
        minimum_s = min(minimum_s, center-radius)
        maximum_s = max(maximum_s, center+radius)
        sums = right_chart_enclosure(coefficients, center, radius, Q('1.12'))
        assert all(a < b for a,b in zip(sums,(Q('.60'),Q('.42'),Q('.56'))))
    assert Q('0.314')**2*minimum_s > Q(1,16)
    assert Q('0.248')**2*maximum_s < Q(1,16)
    angular = Q(67,61)
    assert Q('.314')*angular < Q('.35')
    assert maximum_s*angular**2 < Q('1.12')**2
    assert Q('.25')/Q('1.65') < Q('.152')
    assert Q('1.35')/4 < Q('.34')
    assert 16*maximum_s**2 < 17
    assert (Q('.25')/Q('1.65')**2)**2 < Q('.009')
    assert (1/Q(17,15))**2 + (Q('.228')/Q(8,15))**2 < 1
    assert Q(17,15)/Q(5,4) + Q(1,20)/Q(3,4) < 1
    assert Q('.248')**2*Q('1.65')**2 > Q(1,6)
    assert Q('.314')**2*Q('2.35')**2 < 1
    for parity in (-1,1):
        modes,_,_ = validated_potential(parity)
        major_direct = sum(abs(c)*k*(5*Q('1.12')**(k-1)
                       + Q('.1')*Q('.152')**(k-1)
                       + Q('.04')*Q('.024')**(k-1))
                       for k,c in enumerate(modes,start=1))
        logs = angular/Q('.248') + 1/Q('1.65') + 2/Q('14.65')
        assert logs + major_direct < 7
    assert sum(abs(Q.from_float(float.fromhex(x))) for x in DATA['parameters']) + sum(PARAMETER_RADII) < Q('.122')
    assert Q('.122')*49 < 6
    lap = (4*Q(1,16)*5*(Q('.114')*3200+21*40)
           + 4*Q('.009')*2*(Q('.023')*3200+21*40)
           + 4*17*(maximum_s*Q('.56')+21*Q('.42')))
    assert Q(1,16) + lap + 2*(256+36*55) < 20000
    # Enlarged strips, still on the same rho=2 patch products.
    assert ellipse_sum(Q('.512'),Q(5,3),range(11)) < Q('3.88')
    assert ellipse_sum(Q('.263'),Q(5,3),range(11,32)) < Q('1.32')
    assert ellipse_sum(Q('.512'),Q(2),range(11)) < 17
    assert ellipse_sum(Q('.263'),Q(2),range(11,32)) < Q('2.32')
    for _, a,b,_,_ in (patch_set()[64::8][:4]+patch_set()[128::8][:4]+patch_set()[192::8][:4]):
        center, radius = (a+b)/2, Q(5,8)*(b-a)
        s_min, s_max = center-radius, center+radius
        assert Q('.95')**2*s_min > Q(1,16)
        assert Q('.248')**2*s_max < Q(1,16)
        assert (Q(3,64)*(b-a))**2 < Q('.05')**2*s_min**3
        yr = Q('.9') if a>=Q(1,4) else Q('.56') if a>=Q(1,9) else Q('.38')
        assert s_max*angular**2 < yr**2
        sums = right_chart_enclosure(coefficients, center, radius, yr)
        assert all(a < b for a,b in zip(sums,(Q('.46'),Q('1.57'),Q('10.6'))))
    assert (1+Q('.95')*angular)/4 < Q('.512')
    assert Q('.25')/(2-Q('.95')*angular) < Q('.263')
    assert (Q('1.01')/Q(17,15))**2 + (Q('.13')/Q(8,15))**2 < 1
    assert Q('.248')**2*Q('1.04') > Q(1,16)
    assert Q('.95')**2*(2+Q('.95')*angular)**2 < 9
    for parity in (-1,1):
        modes,_,_ = validated_potential(parity)
        field = sum(abs(c)*k*(5*Q('1.12')**(k-1)+Q('.275')*Q('.263')**(k-1)
                    +Q('.044')*Q('.038')**(k-1)) for k,c in enumerate(modes,start=1))
        logs = angular/Q('.248') + 1/(2-Q('.95')*angular) + 2/(15-Q('.95')*angular)
        assert logs + field < 7
    lap = (4*Q(1,16)*17*(Q('.263')*3200+21*40)
           + 4*Q('.077')*Q('2.32')*(Q('.061')*3200+21*40)
           + 4*17*(Q(1)*Q('10.6')+21*Q('1.57')))
    # |H| < 404*8 and |1/H| < 404*6 follow from e^6<404.
    assert Q(1,16)+lap+2*(404*8+36*404*6) < 200000
    return Q(20000)


def verify(index):
    patch = patch_set()[index]
    bound = cert(patch, 6)
    if bound >= Q(1,8000):
        bound = cert(patch, 7)
    assert bound < Q(1,8000), (index, float(bound))
    return index, bound


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--start', type=int, default=0)
    parser.add_argument('--count', type=int)
    parser.add_argument('--jobs', type=int, default=1)
    args = parser.parse_args()
    stop = len(patch_set()) if args.count is None else args.start+args.count
    if not 0 <= args.start < stop <= len(patch_set()):
        parser.error('requested tile slice is outside the strip')
    analytic_majorant()
    maximum = Q(0)
    with ProcessPoolExecutor(max_workers=args.jobs) as pool:
        for idx, value in pool.map(verify, range(args.start,stop)):
            print(f'patch {idx:02d}: {float(value):.9g}', flush=True)
            maximum = max(maximum,value)
    print(f'maximum certified weighted residual: {float(maximum):.9g}')


if __name__=='__main__':
    main()
