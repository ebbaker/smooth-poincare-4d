#!/usr/bin/env python3
"""Check the failed prescribed and successful selectable upper chords on the control."""

import hashlib
import json
from collections import Counter
from itertools import combinations

import one_mouth_control as control


def chain(vertices):
    coefficients = Counter()
    for first, second in control.segments(vertices):
        edge = tuple(sorted((first, second)))
        coefficients[edge] += 1 if first < second else -1
    return coefficients


def add_chains(*paths):
    coefficients = Counter()
    for path in paths:
        coefficients.update(chain(path))
    return {edge: count for edge, count in coefficients.items() if count}


def evaluation(vertices, station_vertices):
    cocycles = (control.edge_cochain(first, second, station_vertices)
                for first, second in control.segments(vertices))
    return [sum(coordinates) for coordinates in zip(*cocycles)]


def main():
    regions, walls, station_vertices = control.build()
    faces, disks, disk_boundaries, orientations, marked, values, _ = control.verify(
        regions, walls, station_vertices)
    mesh = control.encode_mesh(regions, walls, faces, disks, disk_boundaries, orientations, marked)
    mesh_data = json.dumps(mesh, sort_keys=True, separators=(",", ":")).encode()

    corners = [(4, 11), (5, 11), (5, 13), (1, 13), (1, 1), (5, 1),
               (5, 10), (6, 10), (6, 11), (10, 11)]

    def upper_path(positions):
        return control.path(*(control.point(x, y, control.HEIGHT) for x, y in positions))

    twisted = upper_path(corners)
    twist_circle = upper_path([(5, 11), (5, 13), (1, 13), (1, 1), (5, 1), (5, 11)])
    square = upper_path([(5, 10), (6, 10), (6, 11), (5, 11), (5, 10)])
    original = marked["upper_chord"]
    section = marked["upper_section"]
    upper_faces = faces["upper"]
    upper_face_edge_uses = Counter(edge for triangle in upper_faces
                                   for edge in combinations(triangle, 2))
    assert twisted[0] == original[0] and twisted[-1] == original[-1]
    assert len(set(twisted)) == len(twisted)
    assert all(upper_face_edge_uses[edge] == 2 for edge in control.edge_support(twisted))
    boundary_vertices = {vertex for edge, count in upper_face_edge_uses.items()
                         if count == 1 for vertex in edge}
    assert set(twisted) & boundary_vertices == {twisted[0], twisted[-1]}
    assert set(original) & set(twist_circle) == {control.point(5, 11, control.HEIGHT)}
    assert all(upper_face_edge_uses[edge] == 2 for edge in control.edge_support(twist_circle))
    cuffs = {number: control.edge_support(marked[f"upper_port_{number}"])
             for number in range(1, 5)}
    partition = control.cut_face_partition(upper_faces, control.edge_support(twist_circle), cuffs)
    assert partition == [[1, 3], [2, 4]]
    square_vertices = set(square)
    square_triangles = {triangle for triangle in upper_faces if set(triangle) <= square_vertices}
    assert len(square_triangles) == 2
    square_edges = Counter(edge for triangle in square_triangles for edge in combinations(triangle, 2))
    assert {edge for edge, count in square_edges.items() if count == 1} == control.edge_support(square)
    assert add_chains(twisted, original[::-1]) == add_chains(twist_circle, square)

    word = twisted + section[1:]
    assert len(set(word[:-1])) + 1 == len(word) and word[0] == word[-1]
    twist_value = evaluation(twist_circle, station_vertices)
    assert twist_value == [0, 1, 1, 0]
    twist_word_value = evaluation(word, station_vertices)
    assert twist_word_value == twist_value and values["upper_meridian"] == [0, 1, 0, 0]
    assert values["upper_word"] == [0, 0, 0, 0] and len(disks["upper_bridge"]) == 12

    print(json.dumps({
        "canonical_mesh_sha256": hashlib.sha256(mesh_data).hexdigest(),
        "tetrahedra": len(regions),
        "twisted_chord_front_xy_corners": corners,
        "twisted_chord_edges": len(twisted) - 1,
        "twist_circle_cuff_partition": partition,
        "twisted_winding_zero_word_evaluation": twist_word_value,
        "one_upper_wall_winding_evaluation": values["upper_meridian"],
        "freely_chosen_replacement_edges": len(original) - 1,
        "replacement_winding_zero_word_evaluation": values["upper_word"],
        "replacement_proper_disk_triangles": len(disks["upper_bridge"]),
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
