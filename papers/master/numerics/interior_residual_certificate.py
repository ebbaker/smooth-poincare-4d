"""Certify the smooth field's PDE residual on the central square or native footprints.

Run with Python 3 and NumPy. All sample arithmetic encloses the real values
using IEEE binary64 basic operations and a one-ulp outward expansion.
The analytic interpolation estimate between samples is explained in the
master central residual note. --all-footprints checks the finite shell cover.
"""
from fractions import Fraction as Q
from functools import lru_cache
import argparse
from math import isqrt
import json
from pathlib import Path

import numpy as np

from native_harmonic_measures import validated_potential

validated_potential = lru_cache(maxsize=2)(validated_potential)


def lower(x):
    return np.nextafter(x, -np.inf)


def upper(x):
    return np.nextafter(x, np.inf)


class Interval:
    __array_priority__ = 1000

    def __init__(self, lo, hi=None):
        self.lo = np.asarray(lo, dtype=np.float64)
        self.hi = self.lo if hi is None else np.asarray(hi, dtype=np.float64)

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __add__(self, other):
        other = interval(other)
        return Interval(lower(self.lo + other.lo), upper(self.hi + other.hi))

    __radd__ = __add__

    def __sub__(self, other):
        return self + (-interval(other))

    def __rsub__(self, other):
        return interval(other) + (-self)

    def __mul__(self, other):
        other = interval(other)
        a, b = self.lo * other.lo, self.lo * other.hi
        c, d = self.hi * other.lo, self.hi * other.hi
        return Interval(lower(np.minimum(np.minimum(a, b), np.minimum(c, d))),
                        upper(np.maximum(np.maximum(a, b), np.maximum(c, d))))

    __rmul__ = __mul__

    def __truediv__(self, other):
        other = interval(other)
        assert np.all((other.lo > 0) | (other.hi < 0))
        return self * Interval(lower(1 / other.hi), upper(1 / other.lo))

    def __rtruediv__(self, other):
        return interval(other) / self

    def sqrt(self):
        assert np.all(self.lo >= 0)
        a = np.maximum(0, lower(np.sqrt(self.lo)))
        b = upper(np.sqrt(self.hi))
        # Check endpoint squares, including any exact zeros.
        assert np.all((a == 0) | (upper(a*a) <= self.lo))
        assert np.all(lower(b*b) >= self.hi)
        return Interval(a, b)

    def exp(self):
        # Scale to |t|<=1/2, where the degree-22 exponential Taylor error
        # is less than 2^-90, then square four times.
        t = self / 16
        assert np.all((t.lo >= -.5) & (t.hi <= .5))
        y = interval(1)
        for j in range(22, 0, -1):
            y = 1 + (t / j) * y
        y += Interval(-2.**-90, 2.**-90)
        for _ in range(4):
            y = y * y
        return y


def interval(x):
    if isinstance(x, Interval):
        return x
    if isinstance(x, Q):
        a = float(x)
        return Interval(lower(a), upper(a))
    return Interval(x)


def pair_scale(value, a):
    return value[0]*a, value[1]*a


def pair_add(value, other):
    return value[0]+other[0], value[1]+other[1]


def product(value, other):
    a, b = value
    c, d = other
    return a*c - b*d, a*d + b*c


def norm_square(value):
    return value[0]*value[0] + value[1]*value[1]


def inverse(value):
    return pair_scale((value[0], -value[1]), 1 / norm_square(value))


def radial_chart(y, derivative_square, rows, modes):
    """Accumulate coefficients, value and flat Laplacian in one chart."""
    r = norm_square(y)
    t = 2*r - 1
    values = [interval(1), t]
    first = [interval(0), interval(2)]
    second = [interval(0), interval(0)]
    for j in range(2, 19):
        values.append(2*t*values[-1] - values[-2])
        first.append(4*values[-2] + 2*t*first[-1] - first[-2])
        second.append(8*first[-2] + 2*t*second[-1] - second[-2])
    powers = [(interval(1), interval(0))]
    for _ in range(20):
        powers.append(product(powers[-1], y))
    total, lap = interval(0), interval(0)
    for row, k in zip(rows, modes):
        v, l = interval(0), interval(0)
        for coefficient, p, dp, ddp in zip(row, values, first, second):
            v += coefficient*p
            l += coefficient*(r*ddp + (k+1)*dp)
        total += powers[k][0]*v
        lap += powers[k][0]*l
    return total, 4*derivative_square*lap


def hole_gradient(z, coefficients):
    zero = interval(0)
    a = inverse((z[0]-1, z[1]))
    b = inverse((16-z[0], -z[1]))
    h = pair_add(pair_scale(a, -1), pair_scale(b, -1))
    direct, image = pair_scale(a, .25), pair_scale(product(z, b), .25)
    for base, prime, sign in [(direct, pair_scale(product(a, a), -.25), 1),
                              (image, pair_scale(product(b, b), 4), -1)]:
        acc = (zero, zero)
        for k in range(len(coefficients), 0, -1):
            acc = pair_add(product(acc, base), (k*interval(coefficients[k-1]), zero))
        h = pair_add(h, pair_scale(product(acc, prime), sign))
    return h


def cos_nodes(stages=7, positive=True):
    # cos(j*pi/128), j=0,...,64. Mirror parity supplies the other nodes.
    row = [interval(1), interval(-1)]
    for _ in range(stages):
        mid = [((1+x)/2).sqrt() for x in row[:-1]] + [interval(0)]
        row = mid + [-v for v in reversed(mid[:-1])]
    return row[:(1 << (stages-1))+1] if positive else row


PARAMETER_RADII = (Q("0.00002"), Q("0.00005"))


def absolute(a):
    return Interval(0, np.maximum(-a.lo, a.hi))


def sample_bounds(data, axes=None, coordinates=None, gradient_error=None):
    raw = np.array([float.fromhex(s) for s in data['coefficients']]).reshape(-1, 19)
    params = [Q.from_float(float.fromhex(s)) for s in data['parameters']]
    radius = Q(9,128)
    nodes = cos_nodes()
    a = float(radius)*Interval(np.array([i.lo for i in nodes]), np.array([i.hi for i in nodes]))
    x, y = (a, a) if axes is None else axes
    z = (Interval(x.lo[:,None], x.hi[:,None]), Interval(y.lo[None,:], y.hi[None,:]))
    if coordinates is not None:
        z = coordinates
    response = np.array([[float.fromhex(x) for x in row] for row in data["response"]]).reshape(32,19,2)

    def chart_sum(matrix):
        coeff = [[interval(v) for v in row] for row in matrix]
        val, lap = radial_chart(pair_scale(z,.25), .0625, coeff[:11], range(0,21,2))
        for center in (1,-1):
            y = pair_scale(inverse((z[0]-center,z[1])), .25)
            rows = [[(-1)**k*c if center == -1 else c for c in row] for k,row in enumerate(coeff[11:])]
            square = norm_square(y)
            value, laplace = radial_chart(y, 16*square*square, rows, range(21))
            val, lap = val + value, lap + laplace
        return val, lap

    val, lap = chart_sum(raw)
    variations = [chart_sum(response[:,:,j]) for j in range(2)]
    real_base = pair_add(product(z,z), (interval(-1),interval(0)))
    modulus = norm_square(real_base).sqrt()
    high = (val + norm_square(z)/64).exp() / (modulus*modulus.sqrt())
    phi = (interval(0),interval(0))
    fields = []
    for parity, parameter in zip((1,-1), params):
        coefficients, _, error = validated_potential(parity)
        a = hole_gradient(z, coefficients)
        b = hole_gradient(pair_scale(z,-1), coefficients)
        approx = pair_add(a, pair_scale(b,-parity))
        # The radius-1/2 native interior estimate also applies at the
        # outer-cuff samples by the smooth odd harmonic reflection there.
        e = float(4*error if gradient_error is None else gradient_error)
        field = pair_add(approx,(Interval(-upper(e),upper(e)),)*2)
        fields.append(product(field,field))
        phi = pair_add(phi,pair_scale(fields[-1],interval(parameter)))
    low = norm_square(phi) / high
    residual = interval(.0625) + lap - 2*(high-low)
    linear = interval(0)
    w = interval(0)
    psi = interval(0)
    for radius, field, (dv,dlap) in zip(PARAMETER_RADII, fields, variations):
        r = interval(radius)
        differential = dlap - 2*(high+low)*dv + 4*(phi[0]*field[0]+phi[1]*field[1])/high
        linear += r*absolute(differential)
        w += r*absolute(dv)
        psi += r*(absolute(field[0])+absolute(field[1]))
    # Taylor remainder on the real line segment to any parameter in the box.
    # Magnitudes w and psi bound |delta v| and |delta Phi|. The factor 2
    # in the reaction cancels the 1/2 in the second-order remainder.
    exp_w = w.exp()
    phi_max = absolute(phi[0])+absolute(phi[1])+psi
    remainder = ((high + phi_max*phi_max/high)*w*w
                 + (2*psi*psi+4*phi_max*psi*w)/high)*exp_w
    sample_max = float(np.max((absolute(residual)+linear+remainder).hi))
    high_range = Interval((high/exp_w).lo, (high*exp_w).hi)
    high_deviation = float(np.max(absolute(high_range-interval(Q(77,100))).hi))
    if axes is not None or coordinates is not None:
        # Bound the reaction/2 on all sample nodes, including parameters.
        delta = exp_w * ((2*(absolute(phi[0])+absolute(phi[1]))+psi)*psi)/high
        added = Interval((low/exp_w-delta).lo, (low*exp_w+delta).hi)
        reaction = high_range + added
        return sample_max, float(np.min(reaction.lo)), float(np.max(reaction.hi))
    return sample_max, high_deviation


def continuation_bounds(data):
    # Holomorphic extension in independent z,w on radius 1/3. The outer and
    # hole chart bounds for |T_j| are (6/5)^j and (7/4)^j, respectively.
    c = [Q.from_float(float.fromhex(x)) for x in data['coefficients']]
    for i,row in enumerate(data["response"]):
        c[i] = abs(c[i]) + sum(abs(Q.from_float(float.fromhex(value)))*radius
                                for value,radius in zip(row,PARAMETER_RADII))
    total = Q(0)
    for i in range(32):
        outer = i < 11
        k = 2*i if outer else i-11
        chart_radius = Q(1,12) if outer else Q(3,8)
        rho = Q(6,5) if outer else Q(7,4)
        multiplicity = 1 if outer else 2
        total += multiplicity * chart_radius**k * sum(
            abs(v)*rho**j for j,v in enumerate(c[19*i:19*i+19]))
    assert total < 5
    params = [Q.from_float(float.fromhex(x)) for x in data['parameters']]
    assert sum(map(abs,params)) + sum(PARAMETER_RADII) < Q(13,100)
    return total


def footprint_tiles():
    """Dyadic quarter-plane grid covering the thickened unit relator circles."""
    tiles = []
    for i in range(17):
        for j in range(9):
            x, y = Q(2*i+1, 16), Q(2*j+1, 16)
            h = Q(1, 16)
            d_min = max(abs(x-1)-h, 0)**2 + (y-h)**2
            d_max = (abs(x-1)+h)**2 + (y+h)**2
            if d_min <= Q(137,128)**2 and d_max >= Q(119,128)**2:
                assert (x-1)**2+y*y >= Q(84,100)**2
                assert x*x+y*y <= Q(216,100)**2
                tiles.append((x, y, h))
    return tiles


def core_tiles():
    """Cover |z|<=2 and |z-1|>=119/128 in the closed first quadrant."""
    h = Q(1,16)
    tiles = []
    for i in range(16):
        for j in range(16):
            x,y = Q(2*i+1,16),Q(2*j+1,16)
            if (x-h)**2+(y-h)**2 > 4 or (abs(x-1)+h)**2+(y+h)**2 < Q(119,128)**2:
                continue
            assert x*x+y*y <= Q("2.16")**2
            assert (x-1)**2+y*y >= Q(".84")**2
            tiles.append((x,y,h))
    return tiles


def footprint_analytic(data):
    """Uniform real parameter bound for the continuation on radius 1/4."""
    total = Q(0)
    for i in range(32):
        k = 2*i if i<11 else i-11
        y, rho = (Q(".61"),Q("1.72")) if i<11 else (Q(".43"),Q("1.83"))
        for j in range(19):
            l = 19*i+j
            c = abs(Q.from_float(float.fromhex(data["coefficients"][l])))
            c += sum(r*abs(Q.from_float(float.fromhex(v))) for r,v in
                     zip(PARAMETER_RADII,data["response"][l]))
            total += (1 if i<11 else 2)*y**k*rho**j*c
    assert total < 16
    return total


def sqrt_bracket(value):
    scale = 10**10
    k = isqrt(value.numerator*scale**2 // value.denominator)
    return Q(k,scale), Q(k+1,scale)


def intermediate_tiles():
    return [(Q(2*i+1,8),Q(2*j+1,8),Q(1,8)) for i in range(8) for j in range(4,8)]


def intermediate_analytic(data, tile):
    x,y,h = tile
    radius = Q(23,6)*h
    total = Q(0)
    for center in (0,-1,1):
        d2 = (x-center)**2+y*y
        d_lower,d_upper = sqrt_bracket(d2)
        if center == 0:
            q = d2/16
            v, dv = d_upper/4, radius/4
            indices = range(11)
        else:
            q = 1/(16*d2)
            v, dv = 1/(4*d_lower), radius/(4*d_lower*(d_lower-radius))
            indices = range(11,32)
        delta = (2*v+dv)*dv
        major = 1+min(2*delta,delta**2/(2*q*(1-q)))
        ellipse = major+sqrt_bracket(major**2-1)[1]
        for i in indices:
            k = 2*i if center==0 else i-11
            for j in range(19):
                index = 19*i+j
                c = abs(Q.from_float(float.fromhex(data["coefficients"][index])))
                c += sum(r*abs(Q.from_float(float.fromhex(b))) for r,b in
                         zip(PARAMETER_RADII,data["response"][index]))
                total += (v+dv)**k * ellipse**j * c
    assert total < 12
    return total


def footprint_tile(data, tile, stages=7):
    x, y, h = tile
    samples = cos_nodes(stages, positive=False)
    unit = Interval([v.lo for v in samples],[v.hi for v in samples])
    axes = (interval(float(x))+float(h)*unit, interval(float(y))+float(h)*unit)
    r, lo, hi = sample_bounds(data, axes)
    # Center the positive reaction before the norming estimate.
    mid = (Q.from_float(lo)+Q.from_float(hi))/2
    assert mid < 100
    spread = (Q.from_float(hi)-Q.from_float(lo))/2
    degree = 36
    tail = 8*Q(10**10)*Q(1,3)**(degree+1)/(1-Q(1,3))**2
    factor = (1-(Q(22,7)*degree/(2*(1 << stages)))**2/2)**-2
    upper_r = factor*(Q.from_float(r)+tail)+tail
    lower_reaction = mid-factor*(spread+tail)-tail
    assert lower_reaction > 0
    return (upper_r+Q(2,3)*Q("2e-9"))/(2*lower_reaction)


def main():
    data = json.loads(Path(__file__).with_name('whole_pants_residual_d18.json').read_text())
    assert (data['degree'],data['modes']) == (18,20)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--footprint-tile', type=int, help='index in the native quarter-plane shell cover')
    parser.add_argument('--all-footprints', action='store_true', help='verify every physical footprint tile')
    parser.add_argument('--intermediate-tile', type=int, help='tile in [0,2] by [1,2]')
    parser.add_argument('--all-intermediate', action='store_true', help='check that rectangle')
    parser.add_argument('--core-tile', type=int, help='one central-interior tile')
    parser.add_argument('--all-core', action='store_true', help='check the central interior')
    args = parser.parse_args()
    if args.core_tile is not None or args.all_core:
        tiles = core_tiles()
        footprint_analytic(data)
        indices = range(len(tiles)) if args.all_core else [args.core_tile]
        for i in indices:
            result = footprint_tile(data,tiles[i],stages=6)
            if result >= Q(1,8000):
                result = footprint_tile(data,tiles[i])
            print(i,*map(float,tiles[i]),float(result),flush=True)
            assert result < Q(1,8000)
        return
    if args.intermediate_tile is not None or args.all_intermediate:
        tiles = intermediate_tiles()
        indices = range(len(tiles)) if args.all_intermediate else [args.intermediate_tile]
        for i in indices:
            cap = intermediate_analytic(data,tiles[i])
            result = footprint_tile(data,tiles[i])
            print(i,*map(float,tiles[i]),float(cap),float(result),flush=True)
            assert result < Q('0.00019')
        return
    if args.footprint_tile is not None or args.all_footprints:
        tiles = footprint_tiles()
        footprint_analytic(data)
        indices = range(len(tiles)) if args.all_footprints else [args.footprint_tile]
        maximum = Q(0)
        for index in indices:
            result = footprint_tile(data,tiles[index])
            maximum = max(result,maximum)
            print(index, *map(float,tiles[index]), float(result), flush=True)
        print('Maximum over tested tiles',float(maximum))
        assert maximum < Q('0.000081243')
        return
    analytic = continuation_bounds(data)
    nodal, h_nodal = sample_bounds(data)
    # Bernstein ellipse rho=3; the tensor cutoff discards all degrees >24
    # in either coordinate. Trigonometric Bernstein bounds the norm from
    # the grid twice using a zero first derivative at a univariate maximum.
    tail = 8*Q(10000)*Q(1,3)**25/(1-Q(1,3))**2
    factor = (1-(Q(22,7)*24/(2*128))**2/2)**-2
    residual = factor*(Q.from_float(nodal)+tail)+tail
    h_error = factor*(Q.from_float(h_nodal)+tail)+tail
    h_lower = Q(77,100)-h_error
    assert h_lower > Q(7,10)
    print('Central square, complex chart sum bound',float(analytic))
    print('Outward nodal residual and H deviation',nodal,h_nodal)
    print('Continuum residual and H lower bound',float(residual),float(h_lower))
    print('Weighted interior residual upper bound',float(residual/(2*h_lower)))
    assert (residual+Q(2,3)*Q("0.000000002")) / (2*h_lower) < Q(1,8000)


if __name__ == '__main__':
    main()
