#!/usr/bin/env python3
"""Finite floating search for SP4-CUT-TUBE-E17 (NumPy only)."""

from math import log

import numpy as np
from numpy.polynomial import Polynomial
from numpy.polynomial.legendre import leggauss


AXIAL_END = 3**(-0.25)
ANISOTROPY_END = log(3) / 4


def profiles(parameters):
    """Return L and the polynomials p, r in q=x², with a=x p and u=x r.

    At the bolt, a is odd with a_s(0)=4. The normalized disk angle turns
    through 4 alpha under the isotropy exp(alpha i). That same isotropy
    rotates the traceless horizontal metric tensor through 4 alpha.
    Its radial coefficient sinh(2u) is odd, so it extends smoothly as
    a linear function of the disk coordinates times a smooth even factor.
    The horizontal trace cosh(2u) is even.
    """
    length, *free = parameters
    q = Polynomial([0, 1])
    envelope = (1 - q)**2
    p = Polynomial([4 * length, (5 * AXIAL_END - 16 * length) / 2,
                    (8 * length - 3 * AXIAL_END) / 2])
    p += q * envelope * Polynomial(free[:3])
    r = ANISOTROPY_END * (3 - q) / 2 + envelope * Polynomial(free[3:])
    return length, p, r


def sinh_tail(value):
    """Evaluate (sinh(y)-y)/y³ with its smooth value at zero."""
    tail = np.empty_like(value)
    small = np.abs(value) < 0.125
    square = value[small]**2
    tail[small] = 1/6 + square * (1/120 + square * (1/5040 + square / 362880))
    big = value[~small]
    tail[~small] = (np.sinh(big) - big) / big**3
    return tail


def curvature(parameters, x):
    """Evaluate R and the two Weyl norms in formulas regular at x=0."""
    length, p_poly, r_poly = profiles(parameters)
    q = x**2
    p, r = p_poly(q), r_poly(q)
    if np.min(p) <= 0 or np.max(np.abs(r)) > 8:
        raise ValueError("outside the sampled regular range")
    p_q, r_q = p_poly.deriv()(q), r_poly.deriv()(q)
    p_tail = Polynomial(p_poly.coef[1:])(q)
    a, u = x * p, x * r
    a_s = (p + 2 * q * p_q) / length
    u_s = (r + 2 * q * r_q) / length
    a_ss_over_a = (6 * p_q + 4 * q * p_poly.deriv(2)(q)) / (length**2 * p)
    u_ss = x * (6 * r_q + 4 * q * r_poly.deriv(2)(q)) / length**2
    p_intrinsic = 2 * np.cosh(2 * u)
    d_intrinsic = 2 * np.sinh(2 * u)
    d_over_a = 4 * (r + 4 * q * r**3 * sinh_tail(2 * u)) / p
    tail_d_over_a2 = 16 * x * r**3 * sinh_tail(2 * u) / p**2
    tail_dp_over_a2 = 128 * x * r**3 * sinh_tail(4 * u) / p**2
    d_u_ratio = 2 * x * (r_q * p - r * p_q) / (length * p**2)
    residual = x * (
        -r * (4 * length + p) * p_tail
        - 2 * p * (r_q * p + r * p_q + 2 * q * r_q * p_q)
    ) / (length**2 * p**2)
    total_sectional = -a_ss_over_a + 2 * p_intrinsic - a**2 - d_over_a**2 - u_s**2
    k_horiz = 2 * p_intrinsic - 3 * a**2 + d_over_a**2 + u_s**2
    k_diff = -4 * d_intrinsic + 4 * tail_dp_over_a2 + 2 * residual
    m_axial = -2 * a_s + 2 * d_over_a * u_s
    m_diff = (
        16 * x * r**2 * (1 + u**2 * sinh_tail(u))**2 * u_s / p
        + 8 * d_u_ratio - 2 * tail_d_over_a2 * a_s - 2 * a * u_s
    )
    axial = (-a_ss_over_a + k_horiz) / 2 - total_sectional / 6
    difference = u_ss + k_diff / 2
    plus_square = 1.5 * (axial + m_axial)**2 + 0.5 * (difference + m_diff)**2
    minus_square = 1.5 * (axial - m_axial)**2 + 0.5 * (difference - m_diff)**2
    return a, 2 * total_sectional, plus_square, minus_square


def check_cartan(parameters):
    """Compare the regularized blocks with the direct structure equations."""
    x = np.linspace(0.01, 1, 101)
    length, p, r = profiles(parameters)
    x_polynomial = Polynomial([0, 1])
    a_profile, u_profile = [x_polynomial * poly(x_polynomial**2) for poly in (p, r)]
    a, u = a_profile(x), u_profile(x)
    a_s, u_s = a_profile.deriv()(x) / length, u_profile.deriv()(x) / length
    a_ss, u_ss = a_profile.deriv(2)(x) / length**2, u_profile.deriv(2)(x) / length**2
    radial = np.array([-a_ss / a, u_ss - u_s**2, -u_ss - u_s**2])
    shape = np.array([a_s / a, -u_s, u_s])
    lengths = np.array([a, np.exp(-u), np.exp(u)])
    structure = 2 * lengths**2 / a
    connection = np.sum(structure, axis=0) / 2 - structure
    skew = np.zeros_like(radial)
    tangential = np.zeros_like(radial)
    for i, j, k in ((0, 1, 2), (1, 2, 0), (2, 0, 1)):
        skew[i] = -structure[i] * shape[i] + connection[k] * shape[j] + connection[j] * shape[k]
        tangential[i] = connection[i] * structure[i] - connection[j] * connection[k] - shape[j] * shape[k]
    scalar = 2 * np.sum(radial + tangential, axis=0)
    electric = (radial + tangential) / 2 - scalar / 12
    _, regular_scalar, plus_square, minus_square = curvature(parameters, x)
    np.testing.assert_allclose(regular_scalar, scalar, atol=1e-9, rtol=1e-8)
    np.testing.assert_allclose(plus_square, np.sum((electric + skew)**2, axis=0),
                               atol=1e-9, rtol=1e-8)
    np.testing.assert_allclose(minus_square, np.sum((electric - skew)**2, axis=0),
                               atol=1e-9, rtol=1e-8)


def quadrature(order):
    x, weights = leggauss(order)
    return (x + 1) / 2, weights / 2


def energies(parameters, rule):
    x, weights = rule
    a, scalar, plus_square, minus_square = curvature(parameters, x)
    volume_weights = weights * parameters[0] * a / 4
    return volume_weights @ plus_square, volume_weights @ minus_square, scalar


def gradient(objective, parameters):
    step = 2e-5
    direction = np.eye(len(parameters)) * step
    return np.array([(objective(parameters+d) - objective(parameters-d))/(2*step)
                     for d in direction])


def minimize(objective, start):
    """Bounded BFGS run with backtracking, without SciPy."""
    parameters = np.array(start, dtype=float)
    identity = np.eye(len(parameters))
    inverse_hessian = identity.copy()
    value = objective(parameters)
    grad = gradient(objective, parameters)
    for _ in range(160):
        direction = -inverse_hessian @ grad
        slope = grad @ direction
        if np.linalg.norm(grad, ord=np.inf) < 1e-5:
            break
        for trial in range(24):
            update = direction * 0.5**trial
            new_parameters = parameters + update
            new_value = objective(new_parameters)
            if new_value <= value + 1e-4 * slope * 0.5**trial:
                break
        else:
            break
        new_grad = gradient(objective, new_parameters)
        change = new_grad - grad
        curvature_step = change @ update
        if curvature_step > 1e-12:
            transform = identity - np.outer(update, change) / curvature_step
            inverse_hessian = (transform @ inverse_hessian @ transform.T
                               + np.outer(update, update) / curvature_step)
        parameters, value, grad = new_parameters, new_value, new_grad
    return parameters


def main():
    search_rule = quadrature(48)
    fine_rule = quadrature(128)
    penalty_grid = np.linspace(0, 1, 129)
    minimum_grid = np.linspace(0, 1, 4097)

    def objective(parameters, weight=1, floor=0.05, refine_penalty=False):
        if not 0.08 < parameters[0] < 3 or np.max(np.abs(parameters[1:])) > 50:
            return 1e8
        try:
            plus, minus, scalar = energies(parameters, search_rule)
            if refine_penalty and np.min(scalar) < 0.25:
                _, scalar, _, _ = curvature(parameters, penalty_grid)
        except ValueError:
            return 1e8
        penalty = np.mean(np.minimum(scalar - floor, 0)**2)
        return (plus + minus) / 2 + weight * penalty

    def report(parameters):
        check_cartan(parameters)
        plus, minus, _ = energies(parameters, fine_rule)
        _, scalar, _, _ = curvature(parameters, minimum_grid)
        np.testing.assert_allclose(plus - minus, -5, atol=1e-8, rtol=0)
        print("L, p extras, r extras:", ", ".join(f"{v:.6f}" for v in parameters))
        print(f"R sampled min: {min(scalar):.10f}")
        print(f"E+/pi²: {plus:.10f}; E-/pi²: {minus:.10f}; "
              f"mean/pi²: {(plus + minus)/2:.10f}; diff/pi²: {plus - minus:.10f}")

    for initial_length in (0.35, 0.55):
        parameters = minimize(objective, [initial_length, 0, 0, 0, 0, 0, 0])
        parameters = np.round(parameters, 6)
        report(parameters)

    for penalty_weight in (5, 50, 500, 5000):
        def penalized(trial):
            return objective(trial, weight=penalty_weight, floor=0.10, refine_penalty=True)

        parameters = np.round(minimize(penalized, parameters), 6)
        report(parameters)


if __name__ == "__main__":
    main()
