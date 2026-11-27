"""Rational half-turn diagram and exact Wirtinger calculations for E72."""

from bisect import bisect_right
from fractions import Fraction as Q
from itertools import combinations, permutations
from math import gcd

from e68_crossing_alexander import crossing_diagram, inverse


def rotate(point):
    x, y, z = point
    return x, -y, -z


def components():
    """B, F+, F−, K, with vertices ordered along their orientations."""
    axis = [(0, Q(-10, 7), -10), (0, Q(10, 7), 10),
            (-30, 200, 10), (-30, -200, -10)]
    upper = [(10, -10, Q(21, 20)), (10, 10, Q(21, 20)),
             (-10, 10, Q(19, 20)), (-10, -10, Q(19, 20))]
    lower = [rotate(upper[-i]) for i in range(4)]
    half = []
    samples = [(0, 1), (Q(3, 5), Q(4, 5)), (1, 0), (Q(3, 5), Q(-4, 5))]
    for sine, cosine in samples:
        tangent = -Q(cosine, 8)
        radius = 10 + 2 * sine * cosine
        half.append((radius * (1 - tangent**2) / (1 + tangent**2),
                     radius * 2 * tangent / (1 + tangent**2), 2 * sine))
    return [axis, upper, lower, half + [rotate(point) for point in half]]


def rotate_parameter(component, parameter):
    if component == 0:
        return 0, (1 - parameter) % 4
    if component in (1, 2):
        return 3 - component, -parameter % 4
    return 3, (parameter + 4) % 8


def free_reduce(word):
    reduced = []
    for letter in word:
        if reduced and reduced[-1] == -letter:
            reduced.pop()
        else:
            reduced.append(letter)
    return reduced


def cyclic_reduce(word):
    word = free_reduce(word)
    first, end = 0, len(word)
    while end - first > 1 and word[first] == -word[end - 1]:
        first += 1
        end -= 1
    return word[first:end]


def cyclic_key(word):
    return min(tuple(row[i:] + row[:i])
               for row in (word, inverse(word)) for i in range(len(row)))


def word_image(word, images):
    return free_reduce(images[abs(letter)] * (1 if letter > 0 else -1)
                       for letter in word)


def diagram_words():
    links = components()
    for comp, vertices in enumerate(links):
        for param, point in enumerate(vertices):
            other, target = rotate_parameter(comp, param)
            assert rotate(point) == links[other][target]

    # (Y,Z) is the plane viewed from +X, so the depth coordinate is X.
    crossings = crossing_diagram(
        [[(y, z, x) for x, y, z in link] for link in links], (Q(0), Q(0))
    )
    offsets, cuts = [], []
    generators = 0
    for comp in range(len(links)):
        positions = sorted(param for _, (under, param), _ in crossings if under == comp)
        assert positions
        offsets.append(generators)
        cuts.append(positions)
        generators += len(positions)

    def arc_at(comp, parameter):
        return offsets[comp] + bisect_right(cuts[comp], parameter) % len(cuts[comp]) + 1

    action = {}
    for comp, positions in enumerate(cuts):
        length = len(links[comp])
        for start, end in zip(positions, positions[1:] + [positions[0] + length]):
            midpoint = ((start + end) / 2) % length
            image = arc_at(*rotate_parameter(comp, midpoint))
            action[arc_at(comp, midpoint)] = image if comp == 3 else -image
    assert all(word_image([image], action) == [arc] for arc, image in action.items())

    relators, longitudes, marked_meridians = [], [], []
    half_word = []
    writhe = [0] * len(links)
    crossing_table = []
    for comp in range(len(links)):
        word = []
        meridian = arc_at(comp, 0)
        marked_meridians.append(meridian)
        for (over, over_param), (under, under_param), sign in sorted(
            crossings, key=lambda data: data[1]
        ):
            if under != comp:
                continue
            before = offsets[comp] + cuts[comp].index(under_param) + 1
            after = arc_at(comp, under_param)
            signed_over = sign * arc_at(over, over_param)
            crossing_table.append((signed_over, before, after))
            relators.append([-signed_over, before, signed_over, -after])
            word.append(signed_over)
            if over == comp:
                writhe[comp] += sign
            if comp == 3 and under_param < 4:
                half_word.append(signed_over)
        longitudes.append(free_reduce(word + [(-meridian if writhe[comp] > 0 else meridian)]
                                     * abs(writhe[comp])))
    keys = {cyclic_key(relator) for relator in relators}
    assert all(cyclic_key(word_image(relator, action)) in keys for relator in relators)
    assert writhe == [1, 0, 0, 0]
    assert word_image([marked_meridians[-1]], action) == [17]
    assert half_word + word_image(half_word, action) == longitudes[-1]

    assert len(crossing_table) == generators == 17
    assert marked_meridians == [1, 8, 12, 16]
    assert longitudes == [[-17, 15, 9, 16, -17, 3, 16, -1],
                          [-16, -17, 3, 16], [-17, 3, 16, 17], [-9, 15]]
    assert half_word == [-9]
    return crossing_table, relators, action, marked_meridians, longitudes, half_word


def filled_relators(s):
    _, diagram, action, meridians, longitudes, half_word = diagram_words()
    h = len(action) + 1
    cone = [[meridians[0]] * 3 + longitudes[0] * 2]
    cone += [[meridian] * 3 + inverse(longitude) * 2
             for meridian, longitude in zip(meridians[1:3], longitudes[1:3])]
    half_turn = [[h, h]] + [[h, arc, -h, -image] for arc, image in sorted(action.items())]
    exponent = s - 1
    native = half_word + [h] + [meridians[-1] if exponent > 0 else -meridians[-1]] * abs(exponent)
    return diagram + cone + half_turn + [native]


def distinct_relators(relators):
    rows = {}
    for word in relators:
        word = cyclic_reduce(word)
        if word:
            rows.setdefault(cyclic_key(word), word)
    return list(rows.values())


def substitute(word, generator, image):
    inverted = inverse(image)
    return free_reduce(letter
                       for current in word
                       for letter in (image if current == generator else
                                      inverted if current == -generator else [current]))


def eliminate(relators):
    """Only solve relators that contain a generator exactly once."""
    relators = distinct_relators(relators)
    log = []
    while True:
        choice = None
        for index, word in enumerate(relators):
            for position, letter in enumerate(word):
                generator = abs(letter)
                if sum(abs(other) == generator for other in word) != 1:
                    continue
                image = word[position + 1:] + word[:position]
                if letter > 0:
                    image = inverse(image)
                reduced = distinct_relators(substitute(other, generator, image)
                                            for j, other in enumerate(relators) if j != index)
                score = (sum(map(len, reduced)), max(map(len, reduced), default=0), generator, index)
                if choice is None or score < choice[0]:
                    choice = (score, generator, image, reduced)
        if choice is None:
            return relators, log
        _, generator, image, relators = choice
        log.append((generator, image))


def determinant(rows):
    total = 0
    for permutation in permutations(range(len(rows))):
        term = 1
        for index, col in enumerate(permutation):
            term *= rows[index][col]
            for earlier_col in permutation[:index]:
                if earlier_col > col:
                    term = -term
        total += term
    return total


def abelian_invariants(relators):
    generators = sorted({abs(letter) for word in relators for letter in word})
    rows = [[word.count(generator) - word.count(-generator) for generator in generators]
            for word in relators]
    factors = []
    previous = 1
    for size in range(1, len(generators) + 1):
        divisor = gcd(*(determinant([[row[col] for col in columns] for row in block])
                        for block in combinations(rows, size)
                        for columns in combinations(range(len(generators)), size)))
        assert divisor
        factors.append(divisor // previous)
        previous = divisor
    return [factor for factor in factors if factor > 1]


def verify_s3(relators):
    """Check the four word consequences and an explicit size-six image."""
    b, f, h = 5, 15, 18
    keys = {cyclic_key(relator) for relator in relators}
    consequences = [
        [h, h], [-h, -b, h, -b], [b, -f, -b, h, f, -h],
        [f, f, -h, b, -f, -h, b],
    ]
    for consequence in consequences:
        assert cyclic_key(consequence) in keys
    # The first four words give h²=1, hbh=b⁻¹, [hb,f]=1, and f=1.
    # After deleting f and replacing h⁻¹ by h, one remaining word is b³
    # up to free and cyclic cancellation and the relation h²=1.
    cone_word = [f, -h, -b, -b, -f, -b, h, f, -h, b, -f, -b, h]
    assert cyclic_key(cone_word) in keys
    without_f = free_reduce(letter for letter in cone_word if abs(letter) != f)
    assert without_f == [-h, -b, -b, -b, h]

    image = {b: (1, 2, 0), -b: (2, 0, 1), f: (0, 1, 2), -f: (0, 1, 2),
             h: (1, 0, 2), -h: (1, 0, 2)}
    for word in relators:
        state = (0, 1, 2)
        for letter in word:
            state = tuple(image[letter][i] for i in state)
        assert state == (0, 1, 2)


def verify_psl29(relators, eliminations):
    identity = (1, 0, 0, 1)
    reduced_images = {3: (0, 12, 12, 2), 17: (13, 11, 7, 6), 18: (0, 28, 1, 0)}

    def multiply(left, right):
        a, b, c, d = left
        e, f, g, h = right
        return tuple(x % 29 for x in (a * e + b * g, a * f + b * h, c * e + d * g, c * f + d * h))

    def project(matrix):
        antipode = tuple(-entry % 29 for entry in matrix)
        return min(matrix, antipode)

    def evaluate(word, images):
        value = identity
        for letter in word:
            a, b, c, d = images[abs(letter)]
            matrix = (a, b, c, d) if letter > 0 else (d, -b % 29, -c % 29, a)
            value = multiply(value, matrix)
        return project(value)

    for a, b, c, d in reduced_images.values():
        assert (a * d - b * c) % 29 == 1
    full_images = reduced_images.copy()
    for generator, image in reversed(eliminations):
        full_images[generator] = evaluate(image, full_images)
    assert len(full_images) == 18
    assert all(evaluate(relator, full_images) == identity for relator in relators)
    assert evaluate([17, 18, -17, -18], full_images) != identity

    seen = {identity}
    pending = [identity]
    while pending:
        current = pending.pop()
        for matrix in reduced_images.values():
            product = project(multiply(current, matrix))
            if product not in seen:
                seen.add(product)
                pending.append(product)
    assert len(seen) == 29 * (29**2 - 1) // 2
    return len(seen)


def main():
    crossings, _, action, meridians, longitudes, half_word = diagram_words()
    print("Crossings (signed over, under before, under after):", crossings)
    print("Signed half-turn:", sorted(action.items()))
    print("Meridians:", meridians, "zero longitudes:", longitudes, "half-word:", half_word)
    for slope, expected in [(-1, [8]), (0, [2]), (1, [4])]:
        original = filled_relators(slope)
        relators, log = eliminate(original)
        assert len(log) == 15
        assert abelian_invariants(relators) == expected
        print("s =", slope, "abelian factors:", expected)
        if slope == -1:
            print("s = -1 quotient PSL(2,29), order:", verify_psl29(original, log))
        if slope == 0:
            verify_s3(relators)
            print("s = 0 Tietze substitutions:", log)
            print("s = 0 remaining relators:", relators)
            print("s = 0 exact group: S3")


if __name__ == "__main__":
    main()
