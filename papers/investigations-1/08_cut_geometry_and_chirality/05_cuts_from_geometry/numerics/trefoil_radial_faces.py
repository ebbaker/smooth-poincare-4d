"""Verify the radial minimal leaves of the TUBE-E01 cap in its two gauges."""
from fractions import Fraction
from pathlib import Path
from runpy import run_path


def main():
    model = Path(__file__).resolve().parents[2] / "03_tubes_and_exteriors"
    arithmetic = run_path(str(model / "numerics/trefoil_certificate.py"))
    interval = arithmetic["Interval"]
    point = interval.point
    poly = arithmetic["polynomial"]
    atan = arithmetic["arctan_reciprocal"]
    trig = arithmetic["trig_at_endpoint"]
    pi = (point(16) * atan(5) - point(4) * atan(239)).outward(10**15)
    theta = point(Fraction(8, 25)) * pi
    sine = interval(trig(theta.lower, 1).lower, trig(theta.upper, 1).upper).outward(10**15)
    cosine = interval(trig(theta.upper, 0).lower, trig(theta.lower, 0).upper).outward(10**15)
    end_radius = point(Fraction(8, 5)) / (pi * sine)
    end_slope = point(0) - end_radius * cosine
    k = point(Fraction(-1, 10))
    p_end = end_radius / point(2) - point(1)
    v = (end_slope - point(1) - point(3) * p_end) / point(2) - point(2) * k
    u = p_end - v - k
    p_coeff = (point(1), u, v, k)
    slope_coeff = (point(1), point(3) * u, point(5) * v, point(7) * k)
    slope_derivative = (point(3) * u, point(10) * v, point(21) * k)
    for j in range(256):
        x = interval(Fraction(j, 256), Fraction(j + 1, 256))
        p = poly(p_coeff, x)
        ap = poly(slope_coeff, x)
        assert p.lower > 0
        if j < 128:
            assert poly(slope_derivative, x).upper < 0
        else:
            assert ap.upper < 0
        shift = x - point(1)
        w = sine + sine * cosine * shift + point(Fraction(3, 50)) * shift.square()
        wx = sine * cosine + point(Fraction(3, 25)) * shift
        signed_derivative = w * ap + point(6) * x * p * wx
        assert w.lower > 0 and signed_derivative.lower > Fraction(2, 5)

    root = interval(Fraction(401, 1000), Fraction(402, 1000))
    assert poly(slope_coeff, point(root.lower)).lower > 0
    assert poly(slope_coeff, point(root.upper)).upper < 0
    p = poly(p_coeff, root)
    curvature = (point(0) - poly(slope_derivative, root)) / (point(2) * p)
    inverse_radius_squared = point(1) / (point(4) * root * p.square())
    assert Fraction(6, 5) < curvature.lower and curvature.upper < Fraction(13, 10)
    assert inverse_radius_squared.lower > Fraction(8, 5)
    print("Unique cap-gauge root: 401/1000 < s²/4 < 402/1000")
    print("6/5 < -a''/a < 13/10; 1/a² > 8/5")
    print("Compact cap: w a' + 3 a w_s > 2/5 on [0,2]")


if __name__ == "__main__":
    main()
