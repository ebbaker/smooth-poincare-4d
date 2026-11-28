"""Check the finite data and exact bounds for the single E06 handle description."""

import argparse
from collections import Counter
from fractions import Fraction
import json
from pathlib import Path


class BadCertificate(ValueError):
    pass


def require(condition, message):
    if not condition:
        raise BadCertificate(message)


def unique_object(entries):
    result = dict(entries)
    require(len(result) == len(entries), "duplicate JSON key")
    return result


def rational(value):
    require(isinstance(value, str), "rational data must use strings")
    return Fraction(value)


def validate(data):
    require(data["format"] == "sp4-cert-e06-5d-v1", "unknown diagram format")
    setting = data["setting"]
    require(setting["ambient_orientation"] == ["X", "Y", "u", "v", "w"]
            and setting["boundary_orientation"] == "outward-first",
            "ambient orientation changed")
    outer, hole, rounding, delta = (
        rational(setting[key])
        for key in ("outer_radius", "hole_radius", "rounding_width", "corner_delta")
    )
    require((outer, hole, rounding) == (4, Fraction(1, 4), Fraction(1, 64)),
            "pants or rounding bound differs from the frozen marking")
    require(0 < delta and 2 * delta**2 < rounding**2
            and setting["corner_profile"] == "psi(b/delta)+psi(d/delta)<=1",
            "corner smoothing may leave its prescribed neighborhood")
    require(setting["product_fiber"] == "closed-unit-D3"
            and setting["disk_piece"] == "pants-minus-open-strip-interiors",
            "wrong disk piece or fiber")

    geometry = data["geometry"]
    radius, epsilon, enlarged, collar = (
        rational(geometry[key])
        for key in ("positive_core_radius", "tube_scale", "enlarged_radius",
                    "collar_half_width")
    )
    require((radius, epsilon, enlarged, collar)
            == (1, Fraction(1, 16), Fraction(5, 4), Fraction(1, 8)),
            "tube is not the frozen marked chart")
    require(0 < 1 - collar < 1 + collar < enlarged, "collar exceeds its chart")
    require(geometry["strip_chart"] == ["a-d*U", "(1-s)*inner(X)+s*outer(X)", "z"]
            and geometry["strip_lower_edge"] == "positive-hole-semicircle"
            and geometry["strip_upper_edge"] == "positive-outer-semicircle",
            "incorrect strip product map")
    require(geometry["time_chart"] == "flat-step-on-equal-slots"
            and geometry["sphere_chart"]
            == ["sin(phi)*cos(theta)", "sin(phi)*sin(theta)", "cos(phi)"]
            and geometry["height"] == ["colatitude", "longitude-mod-one"],
            "incorrect strand height chart")

    one = data["one_handles"]
    require([item["generator"] for item in one] == ["x", "y"], "one-handle labels")
    centers = [rational(item["center_x"]) for item in one]
    widths = [rational(item["strip_half_width"]) for item in one]
    require(centers == [-1, 1], "hole centers differ from the frozen marking")
    separation = centers[1] - centers[0]
    require(2 * hole < separation and sum(widths) < separation,
            "holes or strips overlap")
    require(separation == 2 * radius, "the two projected cores do not meet at zero")
    strip_feet = {"minus": [-1, "s", "z"], "plus": [1, "s", "z"]}
    for item, center, width, radial in zip(one, centers, widths, (1, -1)):
        require(item["feet"] == strip_feet, "foot map does not use the strip chart")
        require(item["positive_core"] == {"start_radial": [radial, 0], "winding": 1}
                and center + radius * radial == 0, "positive core or basepoint")
        require(0 < width < hole < radius and width < abs(center),
                "strip must open the hole and miss the basepoint")
        require((abs(center) + width)**2 + hole**2 < outer**2,
                "strip lower edge need not lie below its upper edge")
        require(abs(center) + radius < outer and separation - width > radius,
                "core escapes the pants or crosses the other strip")
        # On the upper arc Y is positive at each foot, so CCW gives dX/dtheta < 0.
        require(radius**2 - width**2 > 0, "core tangency at a foot")

    two = data["two_handles"]
    require([item["id"] for item in two] == ["r1", "r2"], "two-handle order")
    latitudes = [rational(item["colatitude_in_pi"]) for item in two]
    require(latitudes == [Fraction(1, 3), Fraction(2, 3)], "marked colatitudes")
    spread = epsilon * enlarged
    # Use pi > 3 for the two colatitude bands and their distances from the poles.
    require(2 * spread < 3 * (latitudes[1] - latitudes[0])
            and spread < 3 * min(latitudes[0], 1 - latitudes[1]),
            "latitude bands overlap or reach a pole")
    require(hole + rounding < min(radius, separation - radius) - spread
            and max(map(abs, centers)) + radius + spread + rounding < outer,
            "an enlarged tube approaches a pants edge or rounded corner")

    words = []
    exponent_rows = []
    for component, expected in zip(two, ("XyyxYYY", "XyxxYXX")):
        require(component["longitude_turns"] == 1, "longitude is not a circle coordinate")
        slots = component["slots"]
        require(len(slots) == 7, "expected seven traversals on each component")
        letters = []
        for generator, direction, entry, exit_ in slots:
            require(generator in ("x", "y") and type(direction) is int
                    and direction in (-1, 1), "invalid oriented strand")
            feet = ("minus", "plus") if direction == 1 else ("plus", "minus")
            require((entry, exit_) == feet, "strand uses the wrong feet")
            letters.append(generator if direction == 1 else generator.upper())
        word = "".join(letters)
        require(word == expected, f"unexpected based relator for {component['id']}")
        words.append(word)
        counts = Counter(word)
        exponent_rows.append(tuple(counts[g] - counts[g.upper()] for g in "xy"))
    determinant = (exponent_rows[0][0] * exponent_rows[1][1]
                   - exponent_rows[0][1] * exponent_rows[1][0])
    require(determinant == -1, "unexpected exponent determinant")

    framings = data["framings"]
    raw_frame = framings["attaching_coordinates"]
    normal_frame = framings["tangent_first_normal"]
    require(raw_frame == ["u", "v", "w"], "coordinate framing directions changed")
    require([axis.lstrip("-") for axis in normal_frame] == raw_frame,
            "oriented quotient frame has incorrect axes")
    # In (X,Y,phi,theta) the tangent uses the last axis, followed by u,v,w.
    longitude_first = [3, 0, 1, 2]
    inversions = sum(a > b for i, a in enumerate(longitude_first)
                     for b in longitude_first[i + 1:])
    require(inversions % 2 == 1 and normal_frame == ["u", "v", "-w"]
            and (inversions + sum(axis.startswith("-") for axis in normal_frame)) % 2 == 0,
            "longitude-first to ambient orientation sign is wrong")
    require(framings["coordinate"] == {"fiber_operation": "identity", "turns": 0}
            and framings["opposite_parity"]["fiber_operation"] == "rotate-u-v-positive"
            and framings["opposite_parity"]["turns"] == 1,
            "wrong representatives for the two framing parities")
    require(framings["spin_reference"] == "ambient-Euclidean-trivialization",
            "wrong reference spin structure")
    for kind in ("coordinate", "opposite_parity"):
        turns = framings[kind]["turns"]
        # The tangent frame contributes one longitude turn. The disk contributes
        # one turn in its tangent plane. Equal lift signs give spin extension.
        extends = all((item["longitude_turns"] + turns) % 2 == 1 for item in two)
        require(framings[kind + "_extends_spin"] is extends,
                f"spin parity inconsistent for {kind}")
    require(all(item["framing"] == "coordinate" for item in two),
            "handle does not use the frozen marking")

    maps = data["gluing"]
    require((maps["handle"], maps["attaching_face"], maps["free_face"])
            == ("D2xD3", "S1xD3", "D2xS2"), "incorrect two-handle faces")
    require(maps["retained"] == "full-boundary-minus-two-open-tubes",
            "boundary surgery must retain the whole complement")
    require(maps["charts"] == {
        "tube": ["c_i(t)+epsilon*(u,v)", "phi_i+epsilon*w", "t"],
        "untube": ["longitude", "(q-c_i(longitude))/epsilon", "(phi-phi_i)/epsilon"],
    }, "closing charts do not encode the inverse coordinate operations")
    require(maps["attach_2handle"] == ["tube", "i", "t", "z"],
            "two-handle attachment has wrong fiber arguments")
    require(maps["end"] == maps["cradle"] == ["tube", "i", "t", "p"]
            and maps["end_inverse"] == maps["cradle_inverse"]
            == ["untube", "i", "point"], "end and cradle marks differ")
    require(maps["exterior_collar"] == maps["cradle_collar"]
            == ["tube", "i", "t", "(1+s)*p"]
            and maps["cap_collar"] == ["disk-polar", "t", "1+s", "p"],
            "collar marks disagree at the cut")

    print(f"one 0-handle, {len(one)} 1-handles, {len(two)} 2-handles, 14 traversals")
    print(f"based relators {' '.join(words)} (uppercase denotes inverse)")
    print(f"exponent rows {exponent_rows}, determinant {determinant}")
    print(f"enlarged displacement {spread}: clearance, latitudes and collar passed")
    print("two relative framing parities and the Euclidean spin extension check passed")
    print("common end and cradle seam maps, inverse maps and collar data passed")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path, nargs="?",
                        default=Path(__file__).with_name("e06_handles.json"))
    args = parser.parse_args()
    try:
        with args.certificate.open(encoding="utf-8") as stream:
            validate(json.load(stream, object_pairs_hook=unique_object))
    except (OSError, KeyError, TypeError, ValueError, IndexError) as error:
        parser.exit(1, f"E06 certificate rejected: {error}\n")


if __name__ == "__main__":
    main()
