#!/usr/bin/env python3
"""Periodic flat chiral transfer solver. See ../notes/E01_FLAT.md."""

from dataclasses import dataclass

import numpy as np


def grid(n, half_width):
    """Axis of the centered periodic grid with period 2 * half_width."""
    if n < 3 or not np.isfinite(half_width) or half_width <= 0:
        raise ValueError("need n >= 3 and finite positive half_width")
    return (np.arange(n) - n // 2) * (2 * half_width / n)


def _transfer_numerator(a, b, c, d):
    aa, bb, cc, dd = a * a, b * b, c * c, d * d
    return (
        (aa + bb - cc - dd, 2 * (b * c - a * d), 2 * (b * d + a * c)),
        (2 * (b * c + a * d), aa - bb + cc - dd, 2 * (c * d - a * b)),
        (2 * (b * d - a * c), 2 * (c * d + a * b), aa - bb - cc + dd),
    )


def transfer_symbol(a, b, c, d):
    """T(k) in the bases (e01 ± e23, e02 ± e31, e03 ± e12) / sqrt(2).

    The four coordinates may broadcast. T(0) is zero here.
    """
    a, b, c, d = (np.asarray(x, dtype=float) for x in (a, b, c, d))
    squared_length = a * a + b * b + c * c + d * d
    denominator = np.where(squared_length == 0, 1, squared_length)
    symbol = np.empty(squared_length.shape + (3, 3))
    for i, row in enumerate(_transfer_numerator(a, b, c, d)):
        for j, entry in enumerate(row):
            symbol[..., i, j] = entry / denominator
    return symbol


def _periodic_symbol(n, zero_mode):
    modes = np.rint(np.fft.fftfreq(n) * n)
    real_modes = np.rint(np.fft.rfftfreq(n) * n)
    # Put the Nyquist component of the real spectral derivative at zero.
    # The resulting wavevector is odd under conjugation of the Fourier index.
    if n % 2 == 0:
        modes[n // 2] = real_modes[-1] = 0
    symbol = transfer_symbol(*np.ix_(modes, modes, modes, real_modes))
    symbol[0, 0, 0, 0] = zero_mode
    return symbol


@dataclass
class Solution:
    plus: np.ndarray
    minus: np.ndarray
    iterations: int
    residual: float
    graph_norm_bound: float


def _l2(values):
    flat = values.reshape(-1)
    return np.sqrt(np.einsum("i,i->", flat, flat))


def solve(graph, half_width, leading=None, *, zero_mode=None, tolerance=1e-11,
          max_iterations=100):
    """Solve for a periodic closed triple or a set of leading columns.

    graph is real of shape (n,n,n,n,3,3), with minus rows and plus columns.
    leading is real of shape (3,k) or (3,), with the identity triple by default.
    The returned plus and minus arrays both have shape (n,n,n,n,3,k).
    The residual is ||psi - graph @ plus||_2 / ||graph @ leading||_2, or zero
    when the forcing vanishes. The returned minus field is psi, and
    plus = leading + T(psi). Thus the fixed-point residual is the graph defect.
    With zero_mode=None, the plus field has the prescribed mean. A real 3x3
    zero_mode of norm at most one changes that convention to
    mean(plus) = leading + zero_mode @ mean(minus).
    """
    graph = np.asarray(graph, dtype=float)
    n = graph.shape[0] if graph.ndim else 0
    if graph.shape != (n, n, n, n, 3, 3):
        raise ValueError("graph must have shape (n,n,n,n,3,3)")
    grid(n, half_width)
    if not np.isfinite(graph).all():
        raise ValueError("graph entries must be finite")
    bound = np.sqrt(np.max(np.einsum("...ij,...ij->...", graph, graph)))
    if bound >= 1:
        bound = np.max(np.linalg.svd(graph, compute_uv=False)[..., 0])
    if bound >= 1:
        raise ValueError("pointwise graph operator norm must be less than one")
    leading = np.eye(3) if leading is None else np.asarray(leading, dtype=float)
    if leading.shape == (3,):
        leading = leading[:, None]
    if leading.ndim != 2 or leading.shape[0] != 3 or not np.isfinite(leading).all():
        raise ValueError("leading must be a finite (3,k) array")
    zero_mode = np.zeros((3, 3)) if zero_mode is None else np.asarray(zero_mode, dtype=float)
    if zero_mode.shape != (3, 3) or not np.isfinite(zero_mode).all():
        raise ValueError("zero_mode must be a finite (3,3) array")
    if np.linalg.norm(zero_mode, ord=2) > 1:
        raise ValueError("zero_mode operator norm must be at most one")
    if not np.isfinite(tolerance) or tolerance <= 0 or max_iterations < 1:
        raise ValueError("need finite positive tolerance and max_iterations >= 1")

    minus = graph @ leading
    forcing_norm = _l2(minus)
    if forcing_norm == 0:
        plus = np.broadcast_to(leading, minus.shape).copy()
        return Solution(plus, minus, 0, 0.0, float(bound))

    axes = (0, 1, 2, 3)
    symbol = _periodic_symbol(n, zero_mode)
    for iteration in range(1, max_iterations + 1):
        spectrum = np.fft.rfftn(minus, axes=axes)
        plus_spectrum = symbol @ spectrum
        del spectrum
        plus = np.fft.irfftn(plus_spectrum, s=(n,) * 4, axes=axes)
        del plus_spectrum
        plus += leading
        updated = graph @ plus
        residual = _l2(updated - minus) / forcing_norm
        if residual <= tolerance:
            return Solution(plus, minus, iteration, float(residual), float(bound))
        minus = updated
        del plus
    raise RuntimeError(f"iteration limit reached with relative graph residual {residual:.3e}")
