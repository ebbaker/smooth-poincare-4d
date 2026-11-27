#!/usr/bin/env python3
"""Bounded floating variational trials for the marked short-axis disk, E13."""

import argparse
from math import log

import numpy as np
from numpy.polynomial.legendre import leggauss


END_A = 3 ** (-0.25)
END_U = log(3) / 4
SCALE = 1 / 250
RESOLUTIONS = (8, 14, 22)
STARTS = (
    (0.28, 0.67, 0.55, 1.0),
    (0.58, 1.05, 0.82, 0.02),
    (0.95, 1.75, 1.40, 0.15),
    (1.65, 2.80, 2.25, 0.005),
)
REPLAY_PROFILE = (
    15.99998962210159, 0.07363980571375678, 0.06823878071305368, 0.09106989766207046,
    0.1062925324521505, 0.1275168024862092, 0.1481026549020001, 0.1709437280500772,
    0.1935327515170269, 0.2165524442969646, 0.2387917564823994, 0.2603705335909753,
    0.2812773594973348, 0.3015340442914822, 0.3233137208493299, 0.3457810110780145,
    0.3769390471296878, 0.4099340267504096, 0.4760716930935774, 0.5304959096398421,
    0.7451263653961918, 0.730113887574815, 2.101972974182186, 0.08768556475050075,
    0.05837255602345389, 0.07046437949058722, 0.06603805556846608, 0.06858348047978308,
    0.06731486861641278, 0.06784709459002933, 0.06677787894830483, 0.06614456151309553,
    0.06407474745247412, 0.06180144415222041, 0.05718279498253738, 0.05201096330035521,
    0.04210558875668804, 0.03227838099740707, 0.0116998006705791, -0.003847145720641874,
    -0.0504664483609548, -0.06540286415789574, -0.2175639316323125, -0.1353598425874911,
    -1.132877499107371,
)


def multiply(left, right):
    """Multiply values and their first two q derivatives."""
    a, da, dda = left
    b, db, ddb = right
    return a * b, da * b + a * db, dda * b + 2 * da * db + a * ddb


class Quadrature:
    """Graded Gaussian quadrature with smooth, localised basis functions."""

    def __init__(self, size, order):
        cell_count = 3 * size
        grid = np.linspace(0, 1, cell_count + 1)
        knots = np.sqrt(SCALE * np.expm1(grid * np.log1p(1 / SCALE)))
        knots[-1] = 1
        left, right = knots[:-1, None], knots[1:, None]
        nodes, weights = leggauss(order)
        self.x = ((right + left + (right - left) * nodes) / 2).ravel()
        self.weights = ((right - left) * weights / 2).ravel()
        self.q = self.x**2
        self.size = size
        self.axial_basis, self.transverse_basis = self.basis(self.q)

    def basis(self, q):
        column = q[:, None]
        centres = np.linspace(0, 1, self.size)
        width = 1.25 / (self.size - 1)
        normalization = np.log1p(1 / SCALE)
        coordinate = np.log1p(column / SCALE) / normalization
        first = 1 / (normalization * (column + SCALE))
        second = -first / (column + SCALE)
        offset = (coordinate - centres) / width
        gaussian = np.exp(-offset**2)
        rate = -2 * offset * first / width
        curve = -2 * ((first / width)**2 + offset * second / width)
        derivatives = gaussian, gaussian * rate, gaussian * (rate**2 + curve)
        envelope = (1 - column)**2, -2 * (1 - column), 2
        transverse = multiply(derivatives, envelope)
        bolt = column / (column + SCALE)
        bolt_first = SCALE / (column + SCALE)**2
        bolt_second = -2 * SCALE / (column + SCALE)**3
        axial = multiply(transverse, (bolt, bolt_first, bolt_second))
        return axial, transverse

    def profiles(self, parameters, start):
        """Return length and q-jets of log(a/(4s)) and u/x."""
        lower, upper, _, anisotropy_scale = start
        length = lower + (upper - lower) / (1 + np.exp(-parameters[0]))
        axial = parameters[1:1 + self.size]
        transverse = parameters[1 + self.size:]
        return self.profile_jets(
            self.q, length, axial, transverse, anisotropy_scale,
            (self.axial_basis, self.transverse_basis),
        )

    def profile_jets(self, q, length, axial, transverse, anisotropy_scale, basis):
        axial_basis, transverse_basis = basis
        coefficient = (4 * length / END_A)**2
        terminal_value = np.log(END_A / (4 * length))
        axial_value = terminal_value + np.log1p(coefficient) / 2
        axial_slope = -1 / (2 * (1 + coefficient))
        denominator = 1 + coefficient * q
        axial_jets = (
            -np.log(denominator) / 2 + axial_value * q * (2 - q)
            + axial_slope * q * (q - 1),
            -coefficient / (2 * denominator) + axial_value * (2 - 2 * q)
            + axial_slope * (2 * q - 1),
            coefficient**2 / (2 * denominator**2) - 2 * axial_value + 2 * axial_slope,
        )
        denominator = q + anisotropy_scale
        transverse_value = END_U - END_U / np.sqrt(1 + anisotropy_scale)
        transverse_slope = -END_U / 2 + END_U / (2 * (1 + anisotropy_scale)**1.5)
        transverse_jets = (
            END_U / np.sqrt(denominator) + transverse_value + transverse_slope * (q - 1),
            -END_U / (2 * denominator**1.5) + transverse_slope,
            3 * END_U / (4 * denominator**2.5),
        )
        axial_jets = tuple(value + matrix @ axial for value, matrix in zip(axial_jets, axial_basis))
        transverse_jets = tuple(
            value + matrix @ transverse for value, matrix in zip(transverse_jets, transverse_basis)
        )
        return length, axial_jets, transverse_jets

    def fields(self, parameters, start):
        length, (w, w_q, w_qq), (r, r_q, r_qq) = self.profiles(parameters, start)
        if np.max(np.abs(w.real)) > 12 or np.max(np.abs(r.real)) > 20:
            raise ValueError("outside the evaluated floating range")
        q, x = self.q, self.x
        p = 4 * length * np.exp(w)
        p_q = p * w_q
        p_qq = p * (w_q**2 + w_qq)
        p_tail = 4 * length * np.expm1(w) / q
        a, u = x * p, x * r
        a_s = (p + 2 * q * p_q) / length
        u_s = (r + 2 * q * r_q) / length
        a_ss_over_a = (6 * p_q + 4 * q * p_qq) / (length**2 * p)
        u_ss = x * (6 * r_q + 4 * q * r_qq) / length**2
        p_intrinsic = 2 * np.cosh(2 * u)
        d_intrinsic = 2 * np.sinh(2 * u)
        d_over_a = 4 * (r + 4 * q * r**3 * sinh_tail(2 * u)) / p
        tail_d_over_a2 = 16 * x * r**3 * sinh_tail(2 * u) / p**2
        tail_dp_over_a2 = 128 * x * r**3 * sinh_tail(4 * u) / p**2
        d_u_ratio = 2 * x * (r_q * p - r * p_q) / (length * p**2)
        remainder = x * (
            -r * (4 * length + p) * p_tail
            - 2 * p * (r_q * p + r * p_q + 2 * q * r_q * p_q)
        ) / (length**2 * p**2)
        total = -a_ss_over_a + 2 * p_intrinsic - a**2 - d_over_a**2 - u_s**2
        tangential = 2 * p_intrinsic - 3 * a**2 + d_over_a**2 + u_s**2
        tangential_difference = -4 * d_intrinsic + 4 * tail_dp_over_a2 + 2 * remainder
        magnetic = -2 * a_s + 2 * d_over_a * u_s
        magnetic_difference = (
            16 * x * r**2 * (1 + u**2 * sinh_tail(u))**2 * u_s / p
            + 8 * d_u_ratio - 2 * tail_d_over_a2 * a_s - 2 * a * u_s
        )
        axial = (-a_ss_over_a + tangential) / 2 - total / 6
        difference = u_ss + tangential_difference / 2
        return length, a, 2 * total, axial, difference, magnetic, magnetic_difference

    def residual(self, parameters, start, sign=1):
        length, a, _, axial, difference, magnetic, magnetic_difference = self.fields(parameters, start)
        weight = np.sqrt(self.weights * length * a / 4)
        return np.concatenate((
            np.sqrt(1.5) * weight * (axial + sign * magnetic),
            np.sqrt(0.5) * weight * (difference + sign * magnetic_difference),
        ))

    def terminal_data(self, parameters, start):
        length, *_ = self.profiles(parameters, start)
        axial = parameters[1:1 + self.size]
        transverse = parameters[1 + self.size:]
        q = np.array([0.0, 1.0])
        _, (w, w_q, _), (r, r_q, _) = self.profile_jets(
            q, length, axial, transverse, start[-1], self.basis(q),
        )
        p = 4 * length * np.exp(w)
        return p[0] / length, p[1], r[1], p[1] * (1 + 2 * w_q[1]) / length, (
            r[1] + 2 * r_q[1]
        ) / length


def sinh_tail(value):
    result = np.empty_like(value)
    small = np.abs(value) < 0.2
    square = value[small]**2
    result[small] = 1 / 6 + square * (
        1 / 120 + square * (1 / 5040 + square * (
            1 / 362880 + square * (1 / 39916800 + square / 6227020800)
        ))
    )
    large = value[~small]
    result[~small] = (np.sinh(large) - large) / large**3
    return result


def norm_square(values):
    return float(values @ values)


def optimize(rule, start, iteration_limit=120):
    """One damped Gauss–Newton optimization of the smaller chiral block."""
    lower, upper, length, _ = start
    parameters = np.zeros(1 + 2 * rule.size)
    parameters[0] = np.log((length - lower) / (upper - length))
    result = rule.residual(parameters, start)
    initial_value = norm_square(result)
    damping = 1e-3
    stop = "iteration limit"
    for iteration in range(1, iteration_limit + 1):
        value = norm_square(result)
        jacobian = np.empty((result.size, parameters.size))
        complex_parameters = parameters.astype(complex)
        for column in range(parameters.size):
            complex_parameters[column] += 1e-25j
            jacobian[:, column] = rule.residual(complex_parameters, start).imag / 1e-25
            complex_parameters[column] -= 1e-25j
        gradient = jacobian.T @ result
        matrix = jacobian.T @ jacobian
        diagonal = np.maximum(np.diag(matrix), 1e-9)
        scaled_gradient = np.max(np.abs(gradient) / np.sqrt(diagonal))
        if scaled_gradient < 1e-7:
            stop = "scaled gradient"
            break
        for _ in range(12):
            step = np.linalg.solve(matrix + damping * np.diag(diagonal), -gradient)
            trial = parameters + step
            if abs(trial[0]) <= 16:
                try:
                    trial_result = rule.residual(trial, start)
                except ValueError:
                    pass
                else:
                    if norm_square(trial_result) < value:
                        break
            damping *= 4
        else:
            stop = "damping limit"
            break
        parameters, result = trial, trial_result
        damping = max(1e-7, damping / 2)
        if value - norm_square(result) < 2e-11 * (1 + value):
            stop = "relative decrease"
            break
    return parameters, initial_value, iteration, stop, scaled_gradient


def robin_eigenvalue(rule, parameters, start, degree):
    """Floating invariant Neumann Rayleigh–Ritz upper estimate."""
    length, a, scalar, *_ = rule.fields(parameters, start)
    x = rule.x
    basis = np.cos(np.pi * x[:, None] * np.arange(degree))
    derivative = -np.pi * np.arange(degree) * np.sin(
        np.pi * x[:, None] * np.arange(degree)
    ) / length
    weight = rule.weights * length * a
    mass = basis.T @ (weight[:, None] * basis)
    form = basis.T @ ((weight * scalar)[:, None] * basis)
    form += 6 * derivative.T @ (weight[:, None] * derivative)
    lower = np.linalg.cholesky(mass)
    reduced = np.linalg.solve(lower, form)
    reduced = np.linalg.solve(lower, reduced.T).T
    return np.linalg.eigvalsh((reduced + reduced.T) / 2)[0]


def supersolution_quotient(rule, parameters, start):
    """Sample L_g(phi)/phi for the fixed smooth positive Neumann trial."""
    length, (_, w_q, _), _ = rule.profiles(parameters, start)
    _, _, scalar, *_ = rule.fields(parameters, start)
    x, q = rule.x, rule.q
    phi = 1 + q**3 - 3 * q**4 / 4
    first = 6 * x**5 * (1 - q)
    second = 6 * q**2 * (5 - 7 * q)
    radial_drift = 6 * q**2 * (1 - q) + 2 * x * w_q * first
    return scalar - 6 * (second + radial_drift) / (length**2 * phi)


def replay():
    """Check the recorded best profile without any new optimization."""
    parameters = np.asarray(REPLAY_PROFILE)
    start = STARTS[2]
    rule = Quadrature(RESOLUTIONS[-1], 24)
    length, (w, w_q, w_qq), (r, r_q, r_qq) = rule.profiles(parameters, start)
    keep = rule.x > 0.015
    x = rule.x[keep]
    q = x**2
    w, w_q, w_qq = w[keep], w_q[keep], w_qq[keep]
    r, r_q, r_qq = r[keep], r_q[keep], r_qq[keep]
    a, u = 4 * length * x * np.exp(w), x * r
    axial_shape = (1 / x + 2 * x * w_q) / length
    transverse_shape = (r + 2 * q * r_q) / length
    axial_shape_derivative = (-1 / q + 2 * w_q + 4 * q * w_qq) / length**2
    transverse_shape_derivative = x * (6 * r_q + 4 * q * r_qq) / length**2
    lengths = np.array([a, np.exp(-u), np.exp(u)])
    shape = np.array([axial_shape, -transverse_shape, transverse_shape])
    shape_derivative = np.array([
        axial_shape_derivative, -transverse_shape_derivative, transverse_shape_derivative,
    ])
    radial = -shape_derivative - shape**2
    structure = 2 * lengths**2 / a
    connection = np.sum(structure, axis=0) / 2 - structure
    tangent = np.empty_like(radial)
    mixed = np.empty_like(radial)
    for i, j, k in ((0, 1, 2), (1, 2, 0), (2, 0, 1)):
        tangent[i] = connection[i] * structure[i] - connection[j] * connection[k] - shape[j] * shape[k]
        mixed[i] = -structure[i] * shape[i] + connection[k] * shape[j] + connection[j] * shape[k]
    scalar = 2 * np.sum(radial + tangent, axis=0)
    electric = (radial + tangent) / 2 - scalar / 12
    _, _, regular_scalar, axial, difference, magnetic, magnetic_difference = rule.fields(parameters, start)
    np.testing.assert_allclose(regular_scalar[keep], scalar, atol=2e-9, rtol=2e-9)
    for sign in (1, -1):
        regular = (1.5 * (axial + sign * magnetic)**2
                   + 0.5 * (difference + sign * magnetic_difference)**2)
        np.testing.assert_allclose(
            regular[keep], np.sum((electric + sign * mixed)**2, axis=0), atol=2e-8, rtol=2e-8,
        )
    print("Direct Cartan check on", np.count_nonzero(keep), "quadrature nodes passed")
    print("Bolt slope, terminal a,u and first derivatives:", rule.terminal_data(parameters, start))
    print("24-point cell energies:", [norm_square(rule.residual(parameters, start, sign)) for sign in (1, -1)])
    print("Invariant Robin Ritz:", [robin_eigenvalue(rule, parameters, start, n) for n in (20, 40, 60)])
    print("Sampled scalar minimum:", float(np.min(regular_scalar)))
    quotient = supersolution_quotient(rule, parameters, start)
    print("Sampled min L_g(phi)/phi:", float(np.min(quotient)), "at x=", rule.x[np.argmin(quotient)])
    x = np.linspace(0, 1, 11)
    q = x**2
    split = 1 + rule.size
    _, (w, _, _), (r, _, _) = rule.profile_jets(
        q, length, parameters[1:split], parameters[split:], start[-1], rule.basis(q),
    )
    print("s, a, u samples:")
    for position, axial_length, anisotropy in zip(length * x, 4 * length * x * np.exp(w), x * r):
        print(f"    {position:.7f} {axial_length:.7f} {anisotropy:.7f}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--replay", action="store_true", help="check the recorded profile only")
    if parser.parse_args().replay:
        replay()
        return
    best = None
    for size in RESOLUTIONS:
        rule = Quadrature(size, 8)
        fine = Quadrature(size, 16)
        for index, start in enumerate(STARTS, start=1):
            parameters, initial, count, reason, gradient = optimize(rule, start)
            length, a, scalar, *_ = fine.fields(parameters, start)
            plus = norm_square(fine.residual(parameters, start))
            minus = norm_square(fine.residual(parameters, start, sign=-1))
            np.testing.assert_allclose(
                fine.terminal_data(parameters, start), [4, END_A, END_U, 0, 0], atol=2e-12,
            )
            search_plus = norm_square(rule.residual(parameters, start))
            print(
                f"size={size:2d} seed={index} L={length:.8f} V={fine.weights @ (length*a):.7f} "
                f"E+={plus:.9f} E-={minus:.9f} shift={plus-minus+5:+.2e} "
                f"quadrature={plus-search_plus:+.2e} minR={min(scalar):.5f} "
                f"initial={initial:.5f} iters={count:3d} grad={gradient:.2e} {reason}",
                flush=True,
            )
            if best is None or plus < best[0]:
                best = plus, parameters, start, fine
            if plus < 1.65:
                print("    invariant Robin Ritz", [
                    robin_eigenvalue(fine, parameters, start, degree)
                    for degree in (20, 40, 60)
                ], flush=True)
    _, parameters, start, rule = best
    print("Best start:", start, "basis size:", rule.size)
    print("Best parameters:", ", ".join(format(value, ".16g") for value in parameters))
    print("Best invariant Robin Ritz:", [
        robin_eigenvalue(rule, parameters, start, degree) for degree in (20, 40, 60)
    ])


if __name__ == "__main__":
    main()
