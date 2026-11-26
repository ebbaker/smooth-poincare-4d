#!/usr/bin/env python3
"""Generate and verify the marked, stationary-filled one-mouth unlink control."""

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from itertools import combinations, permutations, product
from pathlib import Path


SIZE = 16
HEIGHT = 12
PATCHES = ((2, 4), (10, 12))
LOWER_MOUTH = ((1, 13), (1, 7), (0, 4))
UPPER_MOUTH = ((1, 13), (9, 13), (8, 12))
STATIONARY_BALL = (6, 5, 2)


def box(x_interval, y_interval, t_interval):
    return set(product(*(range(low, high) for low, high in
                         (x_interval, y_interval, t_interval))))


def freudenthal(origin, axes, reverse=()):
    """The usual six-tetrahedron triangulation, with optional reversed axes."""
    for order in permutations(axes):
        vertex = list(origin)
        for axis in reverse:
            vertex[axis] += 1
        tetrahedron = [tuple(vertex)]
        for axis in order:
            vertex[axis] += -1 if axis in reverse else 1
            tetrahedron.append(tuple(vertex))
        yield tuple(sorted(tetrahedron))


def slab_cubes():
    """Cubical boundary of [0,16]^2 x [0,1], crossed with [0,12]."""
    for fixed, end in product(range(3), (0, 1)):
        axes = tuple(axis for axis in range(4) if axis != fixed)
        lengths = (SIZE, SIZE, 1, HEIGHT)
        ranges = [range(length) for length in lengths]
        ranges[fixed] = [end * lengths[fixed]]
        for base in product(*ranges):
            yield base, axes


def tubes():
    low_y, high_y = PATCHES
    left_x, right_x = PATCHES
    lower = (box(left_x, low_y, (0, 3)) | box(right_x, low_y, (0, 3))
             | box((2, 12), low_y, (1, 3)))
    upper = (box(left_x, high_y, (9, 12)) | box(right_x, high_y, (9, 12))
             | box((2, 12), high_y, (9, 11)))
    rails = [
        box(x_span, high_y, (0, 7)) | box(x_span, (2, 12), (5, 7))
        | box(x_span, low_y, (5, 12))
        for x_span in PATCHES
    ]
    return {"lower_wall": lower, "upper_wall": upper,
            "rail_1_wall": rails[0], "rail_2_wall": rails[1]}


def filling_piece():
    """Punctured S^2 x S^1 on the six cube faces and a four-edge circle."""
    piece = []
    for fixed, end in product(range(3), (0, 1)):
        axes = tuple(axis for axis in range(4) if axis != fixed)
        for time in range(4):
            if (fixed, end, time) == (2, 0, 0):
                continue
            origin = [0, 0, 0, time]
            origin[fixed] = end
            # The interval [3,4] is [0,3] in increasing global circle order.
            for tetrahedron in freudenthal(origin, axes, (3,) if time == 3 else ()):
                piece.append(tuple(sorted((x, y, z, t % 4) for x, y, z, t in tetrahedron)))
    return piece


def filling_vertex(vertex):
    x, y, z, t = vertex
    if z == 0 and t in (0, 1):
        a, b, c = STATIONARY_BALL
        return (a + x, b + y, 0, c + t, 0)
    return x, y, z, t, 1


def build():
    regions = {}
    walls = tubes()
    drilled_tiles = set().union(*walls.values())
    assert len(drilled_tiles) == sum(map(len, walls.values()))
    lower_region = box(*LOWER_MOUTH)
    upper_region = box(*UPPER_MOUTH)
    assert STATIONARY_BALL in lower_region - drilled_tiles
    assert walls["lower_wall"] < lower_region and walls["upper_wall"] < upper_region
    assert all(not (walls[name] & (lower_region | upper_region))
               for name in ("rail_1_wall", "rail_2_wall"))
    for base, axes in slab_cubes():
        x, y, side, time = base
        tile = x, y, time
        region = "remainder"
        if axes == (0, 1, 3) and side == 0:
            if tile in drilled_tiles or tile == STATIONARY_BALL:
                continue
            if tile in lower_region:
                region = "lower"
            if tile in upper_region:
                region = "upper"
        for tetrahedron in freudenthal(base, axes):
            regions[tuple(vertex + (0,) for vertex in tetrahedron)] = region

    station_vertices = {}
    for tetrahedron in filling_piece():
        mapped = tuple(sorted(map(filling_vertex, tetrahedron)))
        assert mapped not in regions
        regions[mapped] = "lower"
        station_vertices.update((filling_vertex(vertex), vertex) for vertex in tetrahedron)
    wall_triangles = {}
    for name, tiles in walls.items():
        incidences = Counter()
        for x, y, time in tiles:
            for tetrahedron in freudenthal((x, y, 0, time), (0, 1, 3)):
                incidences.update(combinations((vertex + (0,) for vertex in tetrahedron), 3))
        wall_triangles[name] = {
            face for face, count in incidences.items() if count == 1
            and not any(all(vertex[3] == end for vertex in face) for end in (0, HEIGHT))
        }
    return regions, wall_triangles, station_vertices


def complex_incidence(regions):
    incidences = defaultdict(list)
    for tetrahedron in regions:
        for index, face in enumerate(combinations(tetrahedron, 3)):
            incidences[face].append((tetrahedron, (-1) ** (3 - index)))
    boundary = set()
    neighbors = defaultdict(list)
    for face, uses in incidences.items():
        assert len(uses) in (1, 2)
        if len(uses) == 1:
            boundary.add(face)
        else:
            (first, first_sign), (second, second_sign) = uses
            transport = -first_sign * second_sign
            neighbors[first].append((second, transport))
            neighbors[second].append((first, transport))
    orientations = {min(regions): 1}
    pending = list(orientations)
    while pending:
        current = pending.pop()
        for adjacent, transport in neighbors[current]:
            sign = orientations[current] * transport
            if adjacent in orientations:
                assert orientations[adjacent] == sign
            else:
                orientations[adjacent] = sign
                pending.append(adjacent)
    assert len(orientations) == len(regions)
    for region in set(regions.values()):
        check_region_connected(regions, neighbors, region)
    return incidences, boundary, orientations


def check_region_connected(regions, neighbors, region):
    vertices = {tetrahedron for tetrahedron in regions if regions[tetrahedron] == region}
    seen = {min(vertices)}
    pending = list(seen)
    while pending:
        for adjacent, _ in neighbors[pending.pop()]:
            if adjacent in vertices and adjacent not in seen:
                seen.add(adjacent)
                pending.append(adjacent)
    assert seen == vertices


def check_vertex_links(regions, boundary):
    """Each vertex has a connected triangulated sphere or disk as link."""
    vertex_links = defaultdict(set)
    for tetrahedron in regions:
        for vertex in tetrahedron:
            vertex_links[vertex].add(tuple(other for other in tetrahedron if other != vertex))
    boundary_vertices = {vertex for triangle in boundary for vertex in triangle}
    for vertex, link in vertex_links.items():
        assert surface(link) == ((1, 1) if vertex in boundary_vertices else (2, 0))


def edge_components(edges):
    neighbors = defaultdict(set)
    for first, second in edges:
        neighbors[first].add(second)
        neighbors[second].add(first)
    remaining = set(neighbors)
    components = 0
    while remaining:
        components += 1
        pending = [remaining.pop()]
        while pending:
            new = neighbors[pending.pop()] & remaining
            remaining -= new
            pending.extend(new)
    return components, neighbors


def surface(triangles):
    """Check vertex links and return Euler characteristic and cuff count."""
    edge_use = Counter(edge for face in triangles for edge in combinations(face, 2))
    components, graph = edge_components(edge_use)
    assert components == 1 and all(count in (1, 2) for count in edge_use.values())
    boundary = {edge for edge, count in edge_use.items() if count == 1}
    cuff_count, cuffs = edge_components(boundary)
    assert all(len(adjacency) == 2 for adjacency in cuffs.values())
    link_edges = defaultdict(set)
    for face in triangles:
        for vertex in face:
            link_edges[vertex].add(tuple(other for other in face if other != vertex))
    for vertex, edges in link_edges.items():
        link_components, link = edge_components(edges)
        assert link_components == 1
        degrees = Counter(map(len, link.values()))
        assert set(degrees) <= {1, 2}
        assert degrees[1] == (2 if vertex in cuffs else 0)
    return len(graph) - len(edge_use) + len(triangles), cuff_count


def cut_face_partition(faces, separator, cuffs):
    """Cut a triangulated face on the marked separator edges."""
    uses = defaultdict(set)
    for triangle in faces:
        for edge in combinations(triangle, 2):
            uses[edge].add(triangle)
    assert all(len(uses[edge]) == 2 for edge in separator)
    remaining = set(faces)
    pieces = []
    while remaining:
        pending = [remaining.pop()]
        piece = set(pending)
        while pending:
            for edge in combinations(pending.pop(), 2):
                if edge in separator:
                    continue
                new = uses[edge] & remaining
                remaining -= new
                piece |= new
                pending.extend(new)
        assert surface(piece) == (-1, 3)
        pieces.append(piece)
    assert len(pieces) == 2
    return sorted([number for number, edges in cuffs.items()
                   if all(uses[edge] <= piece for edge in edges)] for piece in pieces)


def check_proper_disk(disk, boundary):
    assert surface(disk) == (1, 1) and not disk & boundary
    disk_edges = Counter(edge for face in disk for edge in combinations(face, 2))
    outer_edges = {edge for edge, count in disk_edges.items() if count == 1}
    boundary_edges = {edge for face in boundary for edge in combinations(face, 2)}
    assert outer_edges == set(disk_edges) & boundary_edges
    outer_vertices = {vertex for edge in outer_edges for vertex in edge}
    ambient_boundary_vertices = {vertex for face in boundary for vertex in face}
    assert outer_vertices == ({vertex for face in disk for vertex in face} & ambient_boundary_vertices)
    return outer_edges


def point(x, y, t):
    return x, y, 0, t, 0


def path(*vertices):
    """Expand a marked axis-aligned polygon into unit mesh edges."""
    expanded = [vertices[0]]
    for start, end in zip(vertices, vertices[1:]):
        axes = [axis for axis in range(len(start)) if start[axis] != end[axis]]
        assert len(axes) == 1
        axis = axes[0]
        direction = 1 if end[axis] > start[axis] else -1
        for coordinate in range(start[axis] + direction, end[axis] + direction, direction):
            partial = list(start)
            partial[axis] = coordinate
            expanded.append(tuple(partial))
    return tuple(expanded)


def cuff(x_span, y_span, time):
    low_x, high_x = x_span
    low_y, high_y = y_span
    return path(point(high_x, low_y, time), point(high_x, high_y, time),
                point(low_x, high_y, time), point(low_x, low_y, time),
                point(high_x, low_y, time))


def seam_cuffs():
    patches = ((PATCHES[0], PATCHES[0]), (PATCHES[1], PATCHES[0]),
               (PATCHES[0], PATCHES[1]), (PATCHES[1], PATCHES[1]))
    return {
        f"{face}_port_{number}": cuff(x_span, y_span, time)
        for face, time in (("lower", 0), ("upper", HEIGHT))
        for number, (x_span, y_span) in enumerate(patches, start=1)
    }


def loops():
    lower_chord = path(point(4, 3, 0), point(10, 3, 0))
    lower_section = path(point(10, 3, 0), point(10, 3, 1),
                         point(4, 3, 1), point(4, 3, 0))
    upper_chord = path(point(4, 11, 12), point(10, 11, 12))
    upper_section = path(point(10, 11, 12), point(10, 11, 11),
                         point(4, 11, 11), point(4, 11, 12))
    return {
        "lower_chord": lower_chord, "upper_chord": upper_chord,
        "lower_section": lower_section, "upper_section": upper_section,
        "lower_word": lower_chord + lower_section[1:],
        "upper_word": upper_chord + upper_section[1:],
        "lower_meridian": cuff(PATCHES[0], PATCHES[0], 0),
        "upper_meridian": cuff(PATCHES[0], PATCHES[1], 12),
        "rail_meridian": cuff(PATCHES[0], PATCHES[1], 0),
        "stationary_meridian": tuple(filling_vertex((0, 0, 0, time))
                                     for time in (0, 1, 2, 3, 0)),
        **seam_cuffs(),
    }


def segments(vertices):
    return zip(vertices, vertices[1:])


def edge_support(vertices):
    return {tuple(sorted(edge)) for edge in segments(vertices)}


def crossing(first, second, axis, numer, denom, ranges):
    """Exact signed intersection with an oriented rectangle in a level plane."""
    start = first[axis] * denom
    stop = second[axis] * denom
    if min(start, stop) >= numer or max(start, stop) <= numer:
        return 0
    direction = 1 if stop > start else -1
    divisor = (stop - start) * direction
    parameter = (numer - start) * direction
    for other_axis, low_num, high_num, range_denom in ranges:
        value = first[other_axis] * divisor + (second[other_axis] - first[other_axis]) * parameter
        if not low_num * divisor <= value * range_denom <= high_num * divisor:
            return 0
    return direction


def edge_cochain(first, second, station_vertices):
    lower = upper = through = stationary = 0
    if first[4] == second[4] == first[2] == second[2] == 0:
        span = (0, 4, 10, 1)
        lower = crossing(first, second, 1, 13, 4, (span, (3, 0, 1, 1)))
        upper = crossing(first, second, 1, 45, 4, (span, (3, 11, 12, 1)))
        through = (
            crossing(first, second, 1, 45, 4, (span, (3, 0, 19, 3)))
            + crossing(first, second, 1, 13, 4, (span, (3, 19, 36, 3)))
            + crossing(first, second, 3, 19, 3, (span, (1, 13, 45, 4)))
        )
    if first in station_vertices and second in station_vertices:
        times = station_vertices[first][3], station_vertices[second][3]
        stationary = {(2, 3): 1, (3, 2): -1}.get(times, 0)
    return lower, upper, through, stationary


def verify(regions, walls, station_vertices):
    incidences, boundary, orientations = complex_incidence(regions)
    check_vertex_links(regions, boundary)
    assert surface(boundary) == (-4, 0)

    faces = {
        name: {triangle for triangle in boundary
               if all(vertex[4] == 0 and vertex[3] == time for vertex in triangle)}
        for name, time in (("lower", 0), ("upper", HEIGHT))
    }
    assert sum(map(len, faces.values())) + sum(map(len, walls.values())) == len(boundary)
    assert set.union(*faces.values(), *walls.values()) == boundary
    assert all(surface(face) == (-2, 4) for face in faces.values())
    assert all(surface(wall) == (0, 2) for wall in walls.values())

    separators = {name: set() for name in faces}
    for face, entries in incidences.items():
        if len(entries) == 2:
            sides = {regions[tetrahedron] for tetrahedron, _ in entries}
            for mouth, separator in separators.items():
                if sides == {mouth, "remainder"}:
                    separator.add(face)
    separator_boundaries = {}
    for mouth, separator in separators.items():
        outer_edges = check_proper_disk(separator, boundary)
        separator_boundaries[mouth] = outer_edges
        face_edges = {edge for face in faces[mouth] for edge in combinations(face, 2)}
        assert outer_edges <= face_edges

    marked_paths = loops()
    for mouth, y, low_t, high_t in (("lower", 3, 0, 1), ("upper", 11, 11, 12)):
        disk = {face for face in incidences if all(
            side == suffix == 0 and vertex_y == y and 4 <= x <= 10 and low_t <= t <= high_t
            for x, vertex_y, side, t, suffix in face)}
        outer_edges = check_proper_disk(disk, boundary)
        assert outer_edges == edge_support(marked_paths[mouth + "_word"])
        assert edge_support(marked_paths[mouth + "_chord"]) <= {
            edge for face in faces[mouth] for edge in combinations(face, 2)}
        assert edge_support(marked_paths[mouth + "_section"]) <= {
            edge for face in walls[mouth + "_wall"] for edge in combinations(face, 2)}
        separators[mouth + "_bridge"] = disk

    cochains = {
        edge: edge_cochain(*edge, station_vertices)
        for edge in {edge for face in incidences for edge in combinations(face, 2)}
    }
    for first, second, third in incidences:
        assert all(a + b == c for a, b, c in zip(cochains[first, second],
                                                  cochains[second, third],
                                                  cochains[first, third]))
    evaluations = {}
    for name, vertices in marked_paths.items():
        value = [0] * 4
        for first, second in segments(vertices):
            edge = tuple(sorted((first, second)))
            sign = 1 if first < second else -1
            for index, coefficient in enumerate(cochains[edge]):
                value[index] += sign * coefficient
        evaluations[name] = value
    for index, name in enumerate(("lower", "upper", "rail", "stationary")):
        assert evaluations[name + "_meridian"] == [int(index == n) for n in range(4)]
    assert evaluations["lower_word"] == evaluations["upper_word"] == [0, 0, 0, 0]
    lower_edges = {edge for tetrahedron in regions if regions[tetrahedron] == "lower"
                   for edge in combinations(tetrahedron, 2)}
    assert all(edge_support(marked_paths[name + "_meridian"]) <= lower_edges
               for name in ("lower", "stationary"))

    port_walls = {
        "lower": ("lower_wall", "lower_wall", "rail_1_wall", "rail_2_wall"),
        "upper": ("rail_1_wall", "rail_2_wall", "upper_wall", "upper_wall"),
    }
    face_partitions = {}
    for mouth, wall_names in port_walls.items():
        face_edge_use = Counter(edge for triangle in faces[mouth]
                                for edge in combinations(triangle, 2))
        cuff_edges = set()
        cuffs = {}
        for number, wall_name in enumerate(wall_names, start=1):
            name = f"{mouth}_port_{number}"
            marked_cuff = edge_support(marked_paths[name])
            wall_edges = {edge for triangle in walls[wall_name]
                          for edge in combinations(triangle, 2)}
            assert marked_cuff <= wall_edges and not marked_cuff & cuff_edges
            cuff_edges |= marked_cuff
            cuffs[number] = marked_cuff
            reference = {"lower_wall": 0, "upper_wall": 1,
                         "rail_1_wall": 2, "rail_2_wall": 2}[wall_name]
            sign = 1 if number in (1, 3) else -1
            assert evaluations[name] == [sign * int(reference == index) for index in range(4)]
        assert cuff_edges == {edge for edge, count in face_edge_use.items() if count == 1}
        face_partitions[mouth] = cut_face_partition(faces[mouth], separator_boundaries[mouth], cuffs)
        assert face_partitions[mouth] == [[1, 2], [3, 4]]
    for number in range(1, 5):
        lower = marked_paths[f"lower_port_{number}"]
        upper = marked_paths[f"upper_port_{number}"]
        assert tuple((x, y, side, HEIGHT, suffix) for x, y, side, _, suffix in lower) == upper
    return faces, separators, separator_boundaries, orientations, marked_paths, evaluations, face_partitions


def encode_mesh(regions, walls, faces, separators, separator_boundaries, orientations, paths):
    vertices = sorted({vertex for tetrahedron in regions for vertex in tetrahedron})
    index = {vertex: number for number, vertex in enumerate(vertices)}
    return {
        "vertices": vertices,
        "tetrahedra": [[*[index[vertex] for vertex in tetrahedron],
                        regions[tetrahedron], orientations[tetrahedron]]
                       for tetrahedron in sorted(regions)],
        "marked_surfaces": {
            name: [[index[vertex] for vertex in triangle] for triangle in sorted(triangles)]
            for name, triangles in (walls | {key + "_face": value for key, value in faces.items()}
                                    | {key + "_disk": value for key, value in separators.items()}).items()
        },
        "separator_boundaries": {
            name: [[index[vertex] for vertex in edge] for edge in sorted(edges)]
            for name, edges in separator_boundaries.items()
        },
        "paths": {name: [index[vertex] for vertex in path] for name, path in paths.items()},
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--mesh", type=Path, help="save canonical marked mesh as JSON")
    args = parser.parse_args()
    regions, walls, station_vertices = build()
    faces, disks, disk_boundaries, orientations, paths, evaluations, partitions = verify(
        regions, walls, station_vertices)
    mesh = encode_mesh(regions, walls, faces, disks, disk_boundaries, orientations, paths)
    data = json.dumps(mesh, sort_keys=True, separators=(",", ":")).encode()
    if args.mesh:
        args.mesh.write_bytes(data)
    result = {
        "vertices": len(mesh["vertices"]),
        "tetrahedra_by_region": dict(Counter(regions.values())),
        "triangles_by_mark": {name: len(mark) for name, mark in mesh["marked_surfaces"].items()},
        "separator_boundary_edges": {name: len(edges) for name, edges in disk_boundaries.items()},
        "cochain_evaluations": evaluations,
        "separator_face_partitions": partitions,
        "canonical_mesh_sha256": hashlib.sha256(data).hexdigest(),
    }
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
