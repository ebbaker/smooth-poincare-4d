"""Floating-point finite-element diagnostic for the two native Hopf parameters.

Requires NumPy. The finite-element and root residuals are discrete. Saved
coefficients and metric evaluations do not enclose the actual harmonic map.
"""
import argparse
from functools import lru_cache
from pathlib import Path

import numpy as np

from native_harmonic_measures import validated_potential


TARGET_LENGTH = 2 * np.arccosh(5.0)
THETA_CORNER = np.arctan2(4.0, -1.0)
INNER_RADIUS = 0.25


@lru_cache(maxsize=2)
def multipole_coefficients(parity):
    coefficients, _, _ = validated_potential(parity)
    return np.asarray([float(coefficient) for coefficient in coefficients])


def pole_derivatives(z, coefficients, second=False):
    direct = INNER_RADIUS / (z - 1)
    image = INNER_RADIUS * z / (16 - z)
    direct_prime = -INNER_RADIUS / (z - 1)**2
    image_prime = 16 * INNER_RADIUS / (16 - z)**2
    terms = coefficients * np.arange(1, len(coefficients) + 1)
    gradient = -1 / (16 - z) - 1 / (z - 1)
    gradient += np.polynomial.polynomial.polyval(direct, terms) * direct_prime
    gradient -= np.polynomial.polynomial.polyval(image, terms) * image_prime
    if not second:
        return gradient
    hessian = -1 / (16 - z)**2 + 1 / (z - 1)**2
    for sign, base, first, dsecond in (
        (1, direct, direct_prime, 2 * INNER_RADIUS / (z - 1)**3),
        (-1, image, image_prime, 32 * INNER_RADIUS / (16 - z)**3),
    ):
        hessian += sign * (
            np.polynomial.polynomial.polyval(base, terms) * dsecond
            + np.polynomial.polynomial.polyval(
                base, terms[1:] * np.arange(1, len(terms))) * first**2
        )
    return gradient, hessian


def hopf_basis(z, second=False):
    values, derivatives = [], []
    for parity in (1, -1):
        coefficients = multipole_coefficients(parity)
        direct = pole_derivatives(z, coefficients, second)
        reflected = pole_derivatives(-z, coefficients, second)
        if second:
            field = direct[0] - parity * reflected[0]
            derivatives.append(2 * field * (direct[1] + parity * reflected[1]))
        else:
            field = direct - parity * reflected
        values.append(field**2)
    fields = np.stack(values, axis=-1)
    return (fields, np.stack(derivatives, axis=-1)) if second else fields


def split_grid(end, corner, count):
    before = min(count - 1, max(1, round(count * corner / end)))
    return np.concatenate((np.linspace(0.0, corner, before + 1),
                           np.linspace(corner, end, count - before + 1)[1:]))


def outer_radius(theta):
    cosine = np.cos(theta)
    on_axis = theta > THETA_CORNER
    axis_radius = np.divide(-1.0, cosine, out=np.zeros_like(cosine), where=on_axis)
    return np.where(theta <= THETA_CORNER,
                    -cosine + np.sqrt(15 + cosine**2),
                    axis_radius)


def point_grid(theta, radial):
    radius = INNER_RADIUS * (outer_radius(theta[:, None]) / INNER_RADIUS)**radial
    return 1 + radius * np.exp(1j * theta[:, None])


class QuarterMesh:
    def __init__(self, angular_cells, radial_cells):
        self.theta = split_grid(np.pi, THETA_CORNER, angular_cells)
        self.radial = split_grid(1.0, np.log(4) / np.log(12), radial_cells)
        points = point_grid(self.theta, self.radial)
        self.points = points.ravel()
        self.mass = np.zeros(self.points.size)
        self.load = np.zeros_like(self.mass)
        self.diagonal = np.zeros_like(self.mass)
        self.stride = radial_cells + 1
        self.offsets = (1, self.stride, self.stride + 1)
        self.off_diagonal = [np.zeros(self.points.size - offset)
                             for offset in self.offsets]

        indices = np.arange(self.points.size).reshape(points.shape)
        a, b, c, d = (indices[:-1, :-1].ravel(), indices[1:, :-1].ravel(),
                      indices[1:, 1:].ravel(), indices[:-1, 1:].ravel())
        triangles = np.concatenate((np.stack((a, b, c), axis=-1),
                                    np.stack((a, c, d), axis=-1)))
        self.assemble(triangles)
        self.node_basis = hopf_basis(self.points)

        outer_rows = np.where(self.theta <= THETA_CORNER)[0]
        outer_angles = np.angle(points[outer_rows, -1])
        self.outer_rule = self.boundary_rule(
            indices[outer_rows, -1], outer_angles, 0, 4, -0.5)
        self.hole_rule = self.boundary_rule(
            indices[:, 0], self.theta, 1, INNER_RADIUS, 8)

    def assemble(self, triangles):
        corners = self.points[triangles]
        differences = np.roll(corners, -1, axis=1) - np.roll(corners, -2, axis=1)
        twice_area = np.abs(np.imag(
            np.conjugate(corners[:, 1] - corners[:, 0])
            * (corners[:, 2] - corners[:, 0])))
        stiffness = (np.real(differences[:, :, None] * np.conjugate(
            differences[:, None, :])) / (2 * twice_area[:, None, None]))
        for i in range(3):
            np.add.at(self.mass, triangles[:, i], twice_area / 6)
            np.add.at(self.diagonal, triangles[:, i], stiffness[:, i, i])
            for j in range(i):
                row = np.minimum(triangles[:, i], triangles[:, j])
                difference = np.abs(triangles[:, i] - triangles[:, j])
                for offset, diagonal in zip(self.offsets, self.off_diagonal):
                    active = difference == offset
                    np.add.at(diagonal, row[active], stiffness[active, i, j])

    def boundary_rule(self, nodes, angles, center, radius, flux):
        spans = np.diff(angles)
        arc_lengths = radius * spans
        np.add.at(self.load, nodes[:-1], flux * arc_lengths / 2)
        np.add.at(self.load, nodes[1:], flux * arc_lengths / 2)
        abscissa, weights = np.polynomial.legendre.leggauss(4)
        fractions = (abscissa + 1) / 2
        weights = arc_lengths[:, None] * (weights / 2)
        angle = angles[:-1, None] + spans[:, None] * fractions
        normal = np.exp(1j * angle)
        tangential_basis = hopf_basis(center + radius * normal) * (-normal**2)[..., None]
        return nodes, fractions, weights, tangential_basis

    def apply_stiffness(self, vector):
        result = self.diagonal * vector
        for offset, diagonal in zip(self.offsets, self.off_diagonal):
            result[:-offset] += diagonal * vector[offset:]
            result[offset:] += diagonal * vector[:-offset]
        return result

    def solve_linear(self, right_side, reaction):
        """Jacobi-preconditioned conjugate gradients for SPD Newton systems."""
        solution = np.zeros_like(right_side)
        residual = right_side.copy()
        inverse = 1 / (self.diagonal + reaction)
        direction = inverse * residual
        energy = np.sum(residual * direction)
        target = max(2e-14, 1e-11 * np.linalg.norm(right_side))
        for index in range(6000):
            if np.linalg.norm(residual) <= target:
                return solution, index
            applied = self.apply_stiffness(direction) + reaction * direction
            step = energy / np.sum(direction * applied)
            solution += step * direction
            residual -= step * applied
            preconditioned = inverse * residual
            next_energy = np.sum(residual * preconditioned)
            direction = preconditioned + (next_energy / energy) * direction
            energy = next_energy
        raise RuntimeError("CG iterations exhausted")

    def solve_scalar(self, coefficients, initial=None):
        phi = self.node_basis @ coefficients
        phi_square = np.abs(phi)**2
        if initial is None:
            initial = (np.abs(self.points)**2 / 64
                       - 1.5 * np.log(np.abs(self.points**2 - 1)))
            initial += np.log((np.pi / 2) / np.sum(self.mass * np.exp(initial)))
        u = initial.copy()

        def residual(value):
            high = np.exp(value)
            low = phi_square / high
            return (self.apply_stiffness(value) + 2 * self.mass * (high - low)
                    - self.load, 2 * self.mass * (high + low))

        current, reaction = residual(u)
        for iteration in range(25):
            norm = np.linalg.norm(current)
            if norm < 3e-11:
                relative_pointwise = np.max(np.abs(current) / self.mass)
                return u, phi, reaction, relative_pointwise, iteration
            update, _ = self.solve_linear(-current, reaction)
            for backtrack in range(15):
                next_u = u + (0.5**backtrack) * update
                next_residual, next_reaction = residual(next_u)
                if np.linalg.norm(next_residual) < norm:
                    u, current, reaction = next_u, next_residual, next_reaction
                    break
            else:
                raise RuntimeError("scalar Newton line search failed")
        raise RuntimeError("scalar Newton iterations exhausted")

    @staticmethod
    def lengths_at_rule(rule, u, coefficients, responses=None):
        nodes, fractions, weights, tangential = rule
        basis = np.stack((1 - fractions, fractions), axis=-1)
        u_arc = u[nodes[:-1], None] * basis[:, 0] + u[nodes[1:], None] * basis[:, 1]
        stretch = np.exp(u_arc / 2)
        phi = tangential @ coefficients
        vector = stretch + phi / stretch
        speed = np.abs(vector)
        length = np.sum(weights * speed)
        if responses is None:
            return length
        response_arc = (responses[nodes[:-1], None, :] * basis[:, 0, None]
                        + responses[nodes[1:], None, :] * basis[:, 1, None])
        derivative = (0.5 * (stretch - phi / stretch)[..., None] * response_arc
                      + tangential / stretch[..., None])
        dlength = np.sum((weights / speed)[..., None]
                         * np.real(np.conjugate(vector)[..., None] * derivative),
                         axis=(0, 1))
        return length, dlength

    def fit(self, coefficients, verbose=True):
        expected = TARGET_LENGTH * np.array([0.25, 0.5])
        rules = (self.outer_rule, self.hole_rule)
        u, phi, reaction, residual, n_scalar = self.solve_scalar(coefficients)
        for outer_iteration in range(15):
            derivatives = 4 * (self.mass * np.exp(-u))[:, None] * np.real(
                np.conjugate(phi)[:, None] * self.node_basis)
            responses = np.stack([self.solve_linear(rhs, reaction)[0]
                                  for rhs in derivatives.T], axis=-1)
            values = [self.lengths_at_rule(rule, u, coefficients, responses)
                      for rule in rules]
            difference = np.array([length for length, _ in values]) - expected
            if verbose:
                print(f"root step {outer_iteration:2d}: {coefficients}, "
                      f"length residual {difference}, {n_scalar} scalar steps",
                      flush=True)
            if np.linalg.norm(difference) < 2e-10:
                return coefficients, u, expected + difference, residual
            step = np.linalg.solve(np.stack([gradient for _, gradient in values]),
                                   -difference)
            for backtrack in range(12):
                next_coefficients = coefficients + 0.5**backtrack * step
                if np.any(np.abs(next_coefficients) > np.array([4.3, 1.9])):
                    continue
                next_u, next_phi, next_reaction, next_residual, next_steps = (
                    self.solve_scalar(next_coefficients, u))
                next_lengths = np.array([self.lengths_at_rule(
                    rule, next_u, next_coefficients) for rule in rules])
                if np.linalg.norm(next_lengths - expected) < np.linalg.norm(difference):
                    coefficients = next_coefficients
                    u, phi, reaction = next_u, next_phi, next_reaction
                    residual, n_scalar = next_residual, next_steps
                    break
            else:
                raise RuntimeError("two-length Newton line search failed")
        raise RuntimeError("two-length Newton iterations exhausted")


def signed_cross(first, second):
    return np.imag(np.conjugate(first) * second)


def evaluate_scalar(theta_grid, radial_grid, values, z):
    """Evaluate the piecewise affine scalar and its gradient in the quarter mesh."""
    theta = np.angle(z - 1)
    radius = np.abs(z - 1)
    radial = np.log(radius / INNER_RADIUS) / np.log(outer_radius(theta) / INNER_RADIUS)
    theta_idx = np.clip(np.searchsorted(theta_grid, theta) - 1, 0, len(theta_grid) - 2)
    radial_idx = np.clip(np.searchsorted(radial_grid, radial) - 1, 0, len(radial_grid) - 2)
    output_u = np.full(z.shape, np.nan)
    output_gradient = np.full(z.shape, np.nan + 1j * np.nan)

    def vertex(i, j):
        angle = theta_grid[i]
        r = INNER_RADIUS * (outer_radius(angle) / INNER_RADIUS)**radial_grid[j]
        return 1 + r * np.exp(1j * angle), values[i, j]

    for offset in (0, -1, 1):
        pending = np.isnan(output_u)
        if not np.any(pending):
            break
        i = theta_idx[pending]
        j = np.clip(radial_idx[pending] + offset, 0, len(radial_grid) - 2)
        a, ua = vertex(i, j)
        c, uc = vertex(i + 1, j + 1)
        for di, dj in ((1, 0), (0, 1)):
            third, uthird = vertex(i + di, j + dj)
            b, d = c - a, third - a
            area = signed_cross(b, d)
            query = z[pending] - a
            weight_c = signed_cross(query, d) / area
            weight_d = signed_cross(b, query) / area
            valid = ((weight_c >= -2e-9) & (weight_d >= -2e-9)
                     & (weight_c + weight_d <= 1 + 2e-9))
            subset = np.nonzero(pending)[0][valid]
            output_u[subset] = (ua + weight_c * (uc - ua) + weight_d * (uthird - ua))[valid]
            gradient = 1j * (b * (uthird - ua) - d * (uc - ua)) / area
            output_gradient[subset] = gradient[valid]
    if np.any(np.isnan(output_u)):
        raise ValueError("query outside the quarter mesh")
    return output_u, output_gradient


@lru_cache(maxsize=4)
def load_fit(path):
    with np.load(path) as saved:
        return saved["theta"], saved["radial"], saved["u"], saved["coefficients"]


def evaluate_metric(path, x, y):
    """Return native q[...,i,j] and dq[...,a,i,j] at broadcastable x,y points."""
    theta, radial, values, coefficients = load_fit(str(Path(path).resolve()))
    x, y = np.broadcast_arrays(np.asarray(x, dtype=float), np.asarray(y, dtype=float))
    xp, yp = x.ravel(), y.ravel()
    quarter = np.abs(xp) + 1j * np.abs(yp)
    u, grad = evaluate_scalar(theta, radial, values, quarter)
    grad_u = np.stack((np.sign(xp) * grad.real, np.sign(yp) * grad.imag), axis=-1)
    fields, derivatives = hopf_basis(xp + 1j * yp, second=True)
    phi, phi_prime = fields @ coefficients, derivatives @ coefficients
    grad_phi = np.stack((phi_prime, 1j * phi_prime), axis=-1)
    high = np.exp(u)
    low = np.abs(phi)**2 / high
    trace_half = high + low
    grad_trace_half = ((high - low)[:, None] * grad_u
                       + 2 * np.real(np.conjugate(phi)[:, None] * grad_phi) / high[:, None])
    q = np.empty((xp.size, 2, 2))
    q[:, 0, 0], q[:, 1, 1] = trace_half + 2 * phi.real, trace_half - 2 * phi.real
    q[:, 1, 0] = q[:, 0, 1] = -2 * phi.imag
    dq = np.empty((xp.size, 2, 2, 2))
    dq[:, :, 0, 0] = grad_trace_half + 2 * grad_phi.real
    dq[:, :, 1, 1] = grad_trace_half - 2 * grad_phi.real
    dq[:, :, 1, 0] = dq[:, :, 0, 1] = -2 * grad_phi.imag
    return q.reshape(x.shape + (2, 2)), dq.reshape(x.shape + (2, 2, 2))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--angular", type=int, default=40)
    parser.add_argument("--radial", type=int, default=32)
    parser.add_argument("--initial", nargs=2, type=float, default=(0.0, 0.0))
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if min(args.angular, args.radial) < 4:
        parser.error("each mesh direction needs at least four cells")
    mesh = QuarterMesh(args.angular, args.radial)
    coefficients, u, lengths, residual = mesh.fit(np.array(args.initial))
    with args.output.open("wb") as output:
        np.savez(output, theta=mesh.theta, radial=mesh.radial,
                 u=u.reshape(len(mesh.theta), len(mesh.radial)), coefficients=coefficients)
    q, dq = evaluate_metric(args.output, [0, 2], [0, 0])
    high = np.exp(u)
    minimum_jacobian = np.min(high - np.abs(mesh.node_basis @ coefficients)**2 / high)
    np.set_printoptions(precision=12)
    print(f"coefficients: {coefficients}; quarter-domain cuff lengths: {lengths}")
    print(f"maximum mass-normalized discrete weak residual: {residual:.3e}")
    print(f"minimum nodal oriented Jacobian: {minimum_jacobian:.12g}")
    print(f"q diagonals at 0, 2:\n{np.diagonal(q, axis1=-2, axis2=-1)}")
    print(f"x derivatives of q diagonals at 0, 2:\n"
          f"{np.diagonal(dq[:, 0], axis1=-2, axis2=-1)}")


if __name__ == "__main__":
    main()
