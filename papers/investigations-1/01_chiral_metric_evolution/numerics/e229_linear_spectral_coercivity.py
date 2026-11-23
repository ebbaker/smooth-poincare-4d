#!/usr/bin/env python3
"""Reproduce the assessed determinant array and certify the B108 coefficient floor."""

import json
import sys
from fractions import Fraction
from hashlib import sha256
from pathlib import Path

sys.dont_write_bytecode = True

NUMERICS = Path(__file__).resolve().parent
FROZEN = {
    "e219_sharp_stationary_verify.py": "446e8d4bf2b77f68bbae3345b5db65eccdeff73b22c933631bd0d8fada1252ae",
    "e202_general_stationary_pinching.py": "bf5473cec7353232fe138b135ad95932efefa78f222d5af35e221a688e2ee386",
    "e187_stationary_kernel.py": "fc14caed87b5d7511f8fae7cb0551879273ef7a83d9dad03287bee609df85d56",
    "e218_stationary_spectral_range.json": "77dbb9396eda03efeeafa375eeaa11e7bba31a3773e0e9f80309df54b2c1cc55",
}
for name, digest in FROZEN.items():
    assert sha256((NUMERICS / name).read_bytes()).hexdigest() == digest, name

from e202_general_stationary_pinching import scalar_block
from e219_sharp_stationary_verify import (
    ZERO, axis_back_to_power, axis_to_bernstein, exact_divide_pair,
    field_sign, leading_determinant, scale, square_block, transpose,
)

CANONICAL_ARRAY_HASH = "9f595dbd0db6cc88c9489fd7545cbb617b9452a55cc300c7de0ca588b9d98978"


def determinant_coefficients():
    """Regenerate only the natural (37,23) determinant array."""
    square, degree = square_block(scalar_block())
    determinant = leading_determinant(square, 3)
    n = max(i for i, _ in determinant)
    m = max(j for _, j in determinant)
    assert (n, m) == (37, 23)
    extra_scale = 2**(3*degree - n)
    power = [[exact_divide_pair(determinant.get((i, j), ZERO), extra_scale)
              for j in range(m+1)] for i in range(n+1)]
    first, factor_a = axis_to_bernstein(power)
    second, factor_b = axis_to_bernstein(transpose(first))
    bernstein = transpose(second)
    back = axis_back_to_power(transpose(axis_back_to_power(transpose(bernstein))))
    assert back == [[scale(c, factor_a * factor_b) for c in row] for row in power]
    return bernstein, 2**n * factor_a * factor_b


def main():
    coefficients, denominator = determinant_coefficients()
    n, m = len(coefficients)-1, len(coefficients[0])-1
    recorded = json.loads((NUMERICS / "e218_stationary_spectral_range.json").read_text())
    determinant_record = recorded["certificate"]["leading_minors"]["012"]
    assert [n, m] == determinant_record["natural_degrees_a_b"]
    assert denominator == determinant_record["scale_denominator"] > 0
    assert determinant_record["intervals_a_b"] == [["0", "1"], ["0", "1"]]
    numerator_digest = sha256(json.dumps(coefficients, separators=(",", ":")).encode()).hexdigest()
    assert numerator_digest == CANONICAL_ARRAY_HASH

    zeros = []
    positive = 0
    at_least_one = 0
    for i, row in enumerate(coefficients):
        for j, (rational, radical) in enumerate(row):
            sign = field_sign((rational, radical))
            assert sign >= 0
            if sign == 0:
                zeros.append([i, j])
                continue
            positive += 1
            if field_sign((rational - denominator, radical)) >= 0:
                at_least_one += 1
    assert zeros == determinant_record["zero_coefficient_indices"] == [[37, 0]]
    assert determinant_record["coefficient_sign_counts_positive_zero_negative"] == [911, 1, 0]
    assert positive == at_least_one == 911

    delta0 = 1
    coercivity = Fraction(3*delta0, 704 * 27648**3 * 880**2)
    print(json.dumps({
        "scope": "natural determinant Bernstein array only, unit square, no subdivision or elevation",
        "frozen_inputs_sha256": FROZEN,
        "natural_bidegree": [n, m],
        "canonical_numerator_pair_array_sha256": numerator_digest,
        "array_serialization": "nested integer numerator pairs, a index then b index, compact JSON",
        "positive_common_denominator": denominator,
        "positive_zero_negative": [positive, len(zeros), 0],
        "zero_indices": zeros,
        "positive_coefficients_at_least_one": at_least_one,
        "minimum_search_or_dyadic_refinement_needed": False,
        "delta0": delta0,
        "coercivity_k": str(coercivity),
    }, indent=2))


if __name__ == "__main__":
    main()
