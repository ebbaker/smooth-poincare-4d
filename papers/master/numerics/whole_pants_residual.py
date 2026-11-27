#!/usr/bin/env python3
"""Smooth scalar and cuff residual diagnostic on the native circular pants.

Requires NumPy and a hopf_cuff_fit.py fit. Grid samples and floating-point
collocation do not bound either residual on the continuous domain.
"""

import argparse
from functools import lru_cache
from pathlib import Path

import numpy as np
from numpy.polynomial.chebyshev import Chebyshev
from numpy.polynomial.legendre import leggauss

from hopf_cuff_fit import TARGET_LENGTH, THETA_CORNER, hopf_basis, load_fit, point_grid


@lru_cache(maxsize=None)
def radial_functions(degree):
    polynomial = Chebyshev.basis(degree, domain=(0, 1))
    return polynomial, polynomial.deriv(), polynomial.deriv(2)


def chart_basis(z, y, dy, degree, modes, normal):
    """Return value, Laplacian, and optionally normal derivative columns."""
    radius_square = np.abs(y)**2
    radial = [tuple(p(radius_square) for p in radial_functions(j))
              for j in range(degree + 1)]
    values, laplacians, derivatives = [], [], []
    for k in modes:
        angular = (y**k).real
        if normal is not None:
            dy_normal = dy * normal
            angular_normal = (k * y**(k - 1) * dy_normal).real if k else np.zeros(z.shape)
            radial_normal = 2 * (y.conj() * dy_normal).real
        for polynomial, first, second in radial:
            values.append(angular * polynomial)
            laplacians.append(4 * np.abs(dy)**2 * angular *
                              (radius_square * second + (k + 1) * first))
            if normal is not None:
                derivatives.append(angular_normal * polynomial + angular * first * radial_normal)
    fields = [np.stack(values, axis=-1), np.stack(laplacians, axis=-1)]
    if normal is not None:
        fields.append(np.stack(derivatives, axis=-1))
    return fields


def basis(z, degree, modes, normal=None):
    outer = chart_basis(z, z / 4, .25, degree, range(0, modes + 1, 2), normal)
    right = chart_basis(z, .25 / (z - 1), -.25 / (z - 1)**2,
                        degree, range(modes + 1), normal)
    left = chart_basis(z, .25 / (z + 1), -.25 / (z + 1)**2,
                       degree, range(modes + 1), normal)
    parity = np.repeat((-1)**np.arange(modes + 1), degree + 1)
    return tuple(np.concatenate((a, b + parity * c), axis=-1)
                 for a, b, c in zip(outer, right, left))


def base(z, normal=None):
    value = np.abs(z)**2 / 64 - 1.5 * np.log(np.abs(z*z - 1))
    if normal is None:
        return value
    gradient = z.conj() / 32 - 3 * z / (z*z - 1)
    return value, (gradient * normal).real


def interior_points(angular, radial):
    before = round(.6 * angular)
    theta = np.r_[np.linspace(0, THETA_CORNER, before, endpoint=False),
                  np.linspace(THETA_CORNER, np.pi, angular - before + 1)]
    radii = .5 - .5 * np.cos(np.linspace(0, np.pi, radial))
    return point_grid(theta, radii).ravel()


def boundary_points(count):
    outer = np.exp(1j * np.linspace(0, np.pi / 2, count))
    hole = np.exp(1j * np.linspace(0, np.pi, count))
    return np.r_[4 * outer, 1 + .25 * hole], np.r_[outer, -hole], np.r_[
        np.full(count, -.5), np.full(count, 8)]


def fit_scalar(degree, modes, initial, parameters):
    z = interior_points(108, 85)
    zb, normal, target_flux = boundary_points(160)
    U, lap = basis(z, degree, modes)
    _, _, dnormal = basis(zb, degree, modes, normal)
    _, base_flux = base(zb, normal)
    base_values = base(z)
    fields = hopf_basis(z)
    phi = fields @ parameters
    phi_square = np.abs(phi)**2
    coefficients = np.zeros(U.shape[1])
    coefficients[0] = initial

    def residual(vector):
        high = np.exp(base_values + U @ vector)
        low = phi_square / high
        defect = 1/16 + lap @ vector - 2 * (high - low)
        flux = 4 * (base_flux + dnormal @ vector - target_flux)
        return np.r_[defect, flux], high, 2 * (high + low)

    for _ in range(7):
        defect, _, reaction = residual(coefficients)
        jacobian = np.r_[lap - reaction[:, None] * U, 4 * dnormal]
        scale = np.r_[1 / np.maximum(.08, reaction), np.ones(zb.size)]
        step = np.linalg.lstsq(jacobian * scale[:, None], -defect * scale, rcond=2e-12)[0]
        norm = np.linalg.norm(defect * scale)
        for backtrack in range(12):
            candidate = coefficients + step * .5**backtrack
            if np.linalg.norm(residual(candidate)[0] * scale) < norm:
                coefficients = candidate
                break
        else:
            break

    _, high, reaction = residual(coefficients)
    jacobian = np.r_[lap - reaction[:, None] * U, 4 * dnormal]
    scale = np.r_[1 / np.maximum(.08, reaction), np.ones(zb.size)]
    forcing = -4 * np.real(phi.conj()[:, None] * fields) / high[:, None]
    forcing = np.r_[forcing, np.zeros((zb.size, 2))]
    response = np.linalg.lstsq(jacobian * scale[:, None], forcing * scale[:, None], rcond=2e-12)[0]
    return coefficients, response


def cuff_lengths(degree, modes, coefficients, parameters, response):
    nodes, weights = leggauss(128)
    lengths, gradients = [], []
    for center, radius, end, multiplier in [(0, 4, np.pi / 2, 4), (1, .25, np.pi, 2)]:
        normal = np.exp(1j * (1+nodes) * end / 2)
        z = center + radius * normal
        U, _ = basis(z, degree, modes)
        stretch = np.exp((base(z) + U @ coefficients) / 2)
        tangential = np.real(-normal[:, None]**2 * hopf_basis(z))
        phi = tangential @ parameters
        scale = multiplier * radius * end / 2
        lengths.append(scale * (weights @ (stretch + phi / stretch)))
        derivative = .5 * (stretch - phi/stretch)[:, None] * (U @ response)
        derivative += tangential / stretch[:, None]
        gradients.append(scale * (weights @ derivative))
    return np.array(lengths), np.array(gradients)


def check_samples(degree, modes, coefficients, parameters):
    z = interior_points(177, 143)
    zb, normal, target_flux = boundary_points(750)
    U, lap = basis(z, degree, modes)
    _, _, dnormal = basis(zb, degree, modes, normal)
    _, base_flux = base(zb, normal)
    high = np.exp(base(z) + U @ coefficients)
    low = np.abs(hopf_basis(z) @ parameters)**2 / high
    residual = np.abs(1/16 + lap @ coefficients - 2 * (high - low))
    flux = np.max(np.abs(base_flux + dnormal @ coefficients - target_flux))
    weighted = (residual + (2/3) * flux) / (2 * (high + low))
    return np.max(residual), flux, np.max(weighted), np.min(high), np.max(high)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--fit", required=True, type=Path)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--degree", type=int, default=18)
    parser.add_argument("--modes", type=int, default=20)
    args = parser.parse_args()
    degree, modes = args.degree, args.modes
    if degree < 1 or modes < 2:
        parser.error("degree must be positive and modes must be at least two")
    theta, radial, values, parameters = load_fit(str(args.fit.resolve()))
    initial = np.median(values[::3, ::3] - base(point_grid(theta[::3], radial[::3])))
    coefficients, response = fit_scalar(degree, modes, initial, parameters.copy())
    lengths, jacobian = cuff_lengths(degree, modes, coefficients, parameters, response)
    shift = -np.linalg.solve(jacobian, lengths - TARGET_LENGTH)
    print("Input parameters", parameters, "full cuff differences", lengths - TARGET_LENGTH)
    print("Length Jacobian\n", jacobian)
    print("Residual sample maxima before adjustment", check_samples(degree, modes, coefficients, parameters))
    parameters = parameters + shift
    coefficients = coefficients + response @ shift
    lengths, _ = cuff_lengths(degree, modes, coefficients, parameters, response)
    print("Adjusted parameters", parameters, "full cuff differences", lengths - TARGET_LENGTH)
    print("Sampled interior, flux, relative residuals and minimum/maximum exp(v)",
          check_samples(degree, modes, coefficients, parameters))
    if args.output:
        np.savez(args.output, coefficients=coefficients, parameters=parameters,
                 response=response, degree=degree, modes=modes)


if __name__ == "__main__":
    main()
