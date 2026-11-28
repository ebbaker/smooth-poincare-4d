"""Finite rational checks for the marked order-seventeen prism exterior."""

from dataclasses import dataclass
from fractions import Fraction
from itertools import combinations


def check_linking_and_height():
    pi_upper = Fraction(22, 7)
    pi_lower = Fraction(157, 50)
    assert Fraction(223, 71) > pi_lower  # Archimedean lower bound

    assert Fraction(4, 17) < Fraction(1, 4)  # cos(4π/17) > 1/√2
    assert 5 * pi_upper / 34 < Fraction(1, 2)
    assert 3 * pi_upper / 34 < Fraction(1, 3)
    lower_angle = Fraction(21, 34)
    sine_lower = lower_angle - lower_angle**3 / 6
    assert 7 * pi_upper / 34 < 1  # Taylor lower bound increasing here
    assert sine_lower > 0 and 3 * sine_lower**2 > 1

    cosine_distances = [min(k, 17 - k) for k in range(17)]
    regular_others = sum(1 if k > 5 else -1 for k in cosine_distances)
    singular_positive = sum(1 if k > 2 else -1 for k in cosine_distances)
    singular_negative = regular_others
    assert 16 + 3 * regular_others == 1
    assert 3 * (singular_positive + singular_negative) == 6

    def cosine_lower(q):
        return 1 - q**2 / 2 + q**4 / 24 - q**6 / 720

    def cosine_upper(q):
        return 1 - q**2 / 2 + q**4 / 24

    theta_lower, theta_upper = Fraction(15, 16), Fraction(31, 32)
    assert 3 * cosine_lower(theta_lower)**2 > 1
    assert 3 * cosine_upper(theta_upper)**2 < 1
    assert 0 < 17 * theta_lower / pi_upper - 5
    assert 17 * theta_upper / pi_lower - 5 < Fraction(1, 4)
    print("Linking sums (regular, singular): (1, 6). Crossing height: 0 < h_* < 1/4.")


@dataclass(frozen=True)
class Crossing:
    x: Fraction
    sign: int
    height_squared: Fraction
    over: str
    under: str

    @property
    def vertical_order(self):
        return self.sign * self.height_squared


def find_crossings():
    radius_squared = {"F": Fraction(25, 4), "L": Fraction(49, 16)}
    center = {"F": 0, "L": 1}
    old_x = {"+": 1, "-": -1}
    for first, second in combinations(("F", "L", "+", "-"), 2):
        if second in radius_squared:
            abscissa = (radius_squared["F"] - radius_squared["L"] + 1) / 2
        elif first in radius_squared:
            abscissa = Fraction(old_x[second])
        else:
            continue
        height_squared = radius_squared[first] - (abscissa - center[first])**2
        if height_squared <= 0:
            assert height_squared < 0  # no tangent crossing
            continue
        for sign in (-1, 1):
            # Depths Y divided by the positive |v| at the crossing.
            depth = {"F": sign, "L": -sign, "+": 0, "-": 0}
            over, under = sorted((first, second), key=depth.get, reverse=True)
            assert depth[over] > depth[under]
            yield Crossing(abscissa, sign, height_squared, over, under)


def traversal(strand, crossings):
    def circular_order(crossing):
        # F is counterclockwise. L is clockwise. Start at the rightmost point.
        first_half = crossing.sign > 0 if strand == "F" else crossing.sign < 0
        return (not first_half, -crossing.x if first_half else crossing.x)

    incident = [crossing for crossing in crossings
                if strand in (crossing.over, crossing.under)]
    if strand in ("+", "-"):
        return sorted(incident, key=lambda crossing: crossing.vertical_order)
    incident.sort(key=circular_order)
    # Rotate to the arc immediately after the indicated undercrossing.
    start = next(index for index, crossing in enumerate(incident)
                 if crossing.under == strand and crossing.over in ("F", "L"))
    return incident[start + 1:] + incident[:start + 1]


def check_crossing_words():
    crossings = list(find_crossings())
    assert len(crossings) == 8
    for crossing in crossings:
        x, sign = crossing.x, crossing.sign
        # First tangent component divided by |v| in this crossing chart.
        tangent = {"F": (-sign, x), "L": (sign, 1 - x),
                   "+": (0, 1), "-": (0, 1)}
        tx, ty = tangent[crossing.over]
        ux, uy = tangent[crossing.under]
        assert tx * uy - ty * ux == -1

    # Labels of successive arcs, with closed strands returning to their starts.
    arc_names = {"F": ("F", "F1", "F2", "F"),
                 "L": ("L", "L1", "L"),
                 "+": ("b", "b1", "b_top"),
                 "-": ("c", "c_top")}
    over_arc = {}
    for strand, arc_labels in arc_names.items():
        arc = 0
        for crossing in traversal(strand, crossings):
            if crossing.under == strand:
                arc += 1
            else:
                over_arc[crossing] = arc_labels[arc]
        assert arc + 1 == len(arc_labels)

    words = {}
    for strand in arc_names:
        words[strand] = tuple(over_arc[crossing]
                              for crossing in traversal(strand, crossings)
                              if crossing.under == strand)
    expected = {"F": ("c", "b", "L"), "L": ("b1", "F"),
                "+": ("L", "F"), "-": ("F",)}
    assert words == expected
    for strand, over_labels in words.items():
        print(f"{strand} undercrossings: {', '.join(over_labels)} (all signs −1)")


if __name__ == "__main__":
    check_linking_and_height()
    check_crossing_words()
