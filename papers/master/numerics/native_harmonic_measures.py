"""Validated Fourier residuals for both native harmonic-measure basis fields.

Uses the closed disk Green function and multipoles at the two original
holes. All certificate arithmetic after specifying the logarithmic poles
is rational. No PDE solver or external library is needed for replay.
"""
from fractions import Fraction as Q

DEGREE = 24
ROUND_DENOMINATOR = 10**24
HOLE_RADIUS = Q(1, 4)


def multiply(a, b):
    """Multiply Taylor polynomials and truncate above the certified degree."""
    return [sum(a[i] * b[n - i] for i in range(n + 1)) for n in range(DEGREE + 1)]


def powers_of_ratio(numerator, denominator):
    """Return Taylor coefficients of every required rational multipole."""
    a, b = numerator
    c, d = denominator
    ratio = [a / c, (b * c - a * d) / c**2]
    for _ in range(2, DEGREE + 1):
        ratio.append(-d * ratio[-1] / c)
    power = [Q(1)] + [Q(0)] * DEGREE
    rows = []
    for _ in range(DEGREE):
        power = multiply(power, ratio)
        rows.append(power)
    return rows


def validated_potential(parity):
    """Fit odd/even image charges and certify the complete boundary residual."""
    assert parity in (-1, 1)
    d = HOLE_RADIUS
    # z=1+d*zeta. The singular direct multipole is zeta**(-k).
    image = powers_of_ratio((d, d*d), (Q(15), -d))
    other = powers_of_ratio((-d, Q(0)), (Q(2), d))
    other_image = powers_of_ratio((-d, -d*d), (Q(17), d))
    regular = [[-image[k][n] + parity * (other[k][n] - other_image[k][n])
                for n in range(DEGREE + 1)] for k in range(DEGREE)]
    log_modes = [(-((d/15)**n) + parity * ((-d/2)**n - (-d/17)**n)) / n
                 for n in range(1, DEGREE + 1)]
    coefficients = [Q(0)] * DEGREE
    for _ in range(16):
        new_coefficients = []
        for n in range(1, DEGREE + 1):
            mode = log_modes[n-1] + sum(coefficients[k] * regular[k][n]
                                        for k in range(DEGREE))
            new_coefficients.append(Q(round(-mode * ROUND_DENOMINATOR), ROUND_DENOMINATOR))
        coefficients = new_coefficients
    residual = sum(abs(log_modes[n-1] + coefficients[n-1] +
                       sum(coefficients[k]*regular[k][n] for k in range(DEGREE)))
                   for n in range(1, DEGREE + 1))
    # On |zeta|=4 the three logarithmic remainders sum to <1:
    # log((15/14)*(17/16)*2) < 1. Bound every kth regular multipole there.
    tail_bound = (1 + sum(abs(b) * (Q(1,28)**k + Q(1,4)**k + Q(1,32)**k)
                          for k, b in enumerate(coefficients, start=1)))
    error = residual + tail_bound / (3 * 4**DEGREE)
    assert sum(map(abs, coefficients)) < Q(1, 3)
    assert residual < Q(1, 10**21)
    assert error < Q(2, 10**15)
    # Mean on the right cuff is log(15) + parity*log(17/8) + mean_offset.
    mean_offset = sum(b*regular[k][0] for k, b in enumerate(coefficients))
    assert abs(mean_offset) < Q(1, 10)
    return coefficients, mean_offset, error


def local_complex_derivatives(z, coefficients):
    """Holomorphic derivatives of the pole + regular multipoles, at a real z."""
    d = HOLE_RADIUS
    pole_gradient = -1/(16-z) - 1/(z-1)
    pole_hessian = -1/(16-z)**2 + 1/(z-1)**2
    gradient, hessian = pole_gradient, pole_hessian
    for k, b in enumerate(coefficients, start=1):
        for sign, value, first, second in (
            (1, d/(z-1), -d/(z-1)**2, 2*d/(z-1)**3),
            (-1, d*z/(16-z), 16*d/(16-z)**2, 32*d/(16-z)**3),
        ):
            gradient += b*sign*k*value**(k-1)*first
            hessian += b*sign*k*value**(k-1)*second
            if k >= 2:
                hessian += b*sign*k*(k-1)*value**(k-2)*first**2
    return gradient, hessian


def anchor_enclosures(parity, coefficients, error):
    """Intervals for the unnormalized exact field P=2∂v and its derivative."""
    fields = []
    for point in (Q(0), Q(2), Q(4)):
        plus = local_complex_derivatives(point, coefficients)
        minus = local_complex_derivatives(-point, coefficients)
        gradient = plus[0] - parity*minus[0]
        hessian = plus[1] + parity*minus[1]
        # Real-part derivative estimate on the radius-1/2 disk; at the
        # outer cuff the zero boundary error extends oddly by inversion.
        fields.append((gradient-4*error, gradient+4*error,
                       hessian-16*error, hessian+16*error))
    if parity == -1:
        assert Q("1.92") < fields[0][0] < fields[0][1] < Q("1.94")
        assert Q("-.765") < fields[1][0] < fields[1][1] < Q("-.764")
    else:
        assert Q("-1.378") < fields[1][0] < fields[1][1] < Q("-1.377")
        assert Q("-.7") < fields[2][0] < fields[2][1] < Q("-.3")
    return fields


if __name__ == "__main__":
    for parity in (1, -1):
        coefficients, offset, error = validated_potential(parity)
        anchors = anchor_enclosures(parity, coefficients, error)
        print("native anchors P(0), P(2), P(4):",
              [round(float((a+b)/2), 9) for a,b,_,_ in anchors])
        print(f"parity {parity:+d}: residual < 2e-15, "
              f"cuff mean offset {float(offset):.12g}, "
              f"certified boundary error {float(error):.4g}")
