#!/usr/bin/env python3
"""Check the E229 determinant coefficient floor by a determinant-first route."""

import json
import sys
from fractions import Fraction
from hashlib import sha256
from math import comb, lcm
from pathlib import Path

sys.dont_write_bytecode = True

NUMERICS = Path(__file__).resolve().parent
FROZEN = {
    "e202_general_stationary_pinching.py": "bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386",
    "e187_stationary_kernel.py": "fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56",
    "e229_linear_spectral_coercivity.json": "b639ede02a3ff497e88d7efbfb9e6e28fb48ff261e6247c8a218c1fadba24e8b",
}
CANONICAL_ARRAY = "9f595dbd0db6cc88c9489fd7545cbb617b9452a55cc300c7de0ca588b9d98978"


def determinant(block):
    """Form the cofactor expansion in the original u,v polynomial ring."""
    (a, b, c), (d, e, f), (g, h, i) = block
    return a * (e * i - f * h) - b * (d * i - f * g) + c * (d * h - e * g)


def square_power(terms):
    """Substitute u=1+h*a*b and v=1+h*a, with 2*h=sqrt(14)-2."""
    degree_a = max(u + v for u, v in terms)
    degree_b = max(u for u, _ in terms)
    counts = [[0] * (degree_b + 1) for _ in range(degree_a + 1)]
    for (u, v), coefficient in terms.items():
        for u_power in range(u + 1):
            for v_power in range(v + 1):
                counts[u_power + v_power][u_power] += (
                    coefficient * comb(u, u_power) * comb(v, v_power)
                )

    numerators = []
    rational, radical = 1, 0
    for i, row in enumerate(counts):
        scale = 2 ** (degree_a - i)
        numerators.append([(count * scale * rational, count * scale * radical)
                           for count in row])
        rational, radical = 14 * radical - 2 * rational, rational - 2 * radical

    # Check actual support after the substitution.
    assert any(pair != (0, 0) for pair in numerators[-1])
    assert any(row[-1] != (0, 0) for row in numerators)
    return numerators, 2**degree_a


def bernstein_first_axis(power):
    """Use x^j = sum_i binom(i,j)/binom(n,j) B_(i,n)(x)."""
    degree = len(power) - 1
    binomials = [comb(degree, j) for j in range(degree + 1)]
    common = lcm(*binomials)
    rows = []
    for i in range(degree + 1):
        weights = [comb(i, j) * (common // binomials[j]) for j in range(i + 1)]
        rows.append([
            (sum(weight * pair[0] for weight, pair in zip(weights, column)),
             sum(weight * pair[1] for weight, pair in zip(weights, column)))
            for column in zip(*power)
        ])
    return rows, common


def is_nonnegative(rational, radical):
    """Decide rational + radical*sqrt(14) >= 0 by integer comparisons."""
    if radical < 0:
        return rational >= 0 and rational**2 >= 14 * radical**2
    return rational >= 0 or rational**2 <= 14 * radical**2


def main():
    for name, digest in FROZEN.items():
        assert sha256((NUMERICS / name).read_bytes()).hexdigest() == digest, name
    from e202_general_stationary_pinching import scalar_block

    power, substitution_scale = square_power(determinant(scalar_block()).terms)
    first, scale_a = bernstein_first_axis(power)
    second, scale_b = bernstein_first_axis(list(zip(*first)))
    rows = list(zip(*second))
    denominator = substitution_scale * scale_a * scale_b
    degrees = [len(rows) - 1, len(rows[0]) - 1]
    assert degrees == [37, 23]
    assert denominator == 4311134142332645259085973815296000
    digest = sha256(json.dumps(rows, separators=(",", ":")).encode()).hexdigest()
    assert digest == CANONICAL_ARRAY

    zero_indices = []
    positive = 0
    floor_comparisons = 0
    for i, row in enumerate(rows):
        for j, (rational, radical) in enumerate(row):
            assert is_nonnegative(rational, radical), (i, j, "negative coefficient")
            if (rational, radical) == (0, 0):
                zero_indices.append([i, j])
                continue
            positive += 1
            assert is_nonnegative(rational - denominator, radical), (i, j, "below one")
            floor_comparisons += 1
    assert zero_indices == [[37, 0]]
    assert positive == floor_comparisons == 911

    coercivity = Fraction(3, 704 * 27648**3 * 880**2)
    record = json.loads((NUMERICS / "e229_linear_spectral_coercivity.json").read_text())
    result = {
        "natural_bidegree": degrees,
        "positive_common_denominator": denominator,
        "canonical_numerator_pair_array_sha256": digest,
        "positive_zero_negative": [positive, len(zero_indices), 0],
        "zero_indices": zero_indices,
        "positive_coefficients_at_least_one": floor_comparisons,
        "delta0": 1,
        "coercivity_k": str(coercivity),
    }
    for key, value in result.items():
        assert record[key] == value, key
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
