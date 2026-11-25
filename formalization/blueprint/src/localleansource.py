"""Resolve blueprint links to declarations in the compiled local Lean package."""

import json
from html import escape
from pathlib import Path


def ProcessOptions(options, document):
    def link_sources():
        tex_dir = Path(document.userdata["working-dir"])
        package = tex_dir.parent.parent
        output = tex_dir / document.config["files"]["directory"]
        requested = set(document.userdata.get("lean_decls", ()))
        links = {}
        for index in (package / ".lake/build/lib/lean").rglob("*.ilean"):
            info = json.loads(index.read_text(encoding="utf-8"))
            names = requested.intersection(info["decls"])
            if not names:
                continue
            module = info["module"]
            source = Path(*module.split(".")).with_suffix(".lean")
            lines = (package / source).read_text(encoding="utf-8").splitlines()
            page = f"{module}.html"
            # Lean records the declaration name's zero-based start line in field 4.
            for name in names:
                line = info["decls"][name][4] + 1
                links[name] = f"{page}#L{line}"
            listing = "\n".join(
                f'<span id="L{i}">{escape(line)}</span>' for i, line in enumerate(lines, 1)
            )
            title = escape(source.as_posix())
            output.mkdir(parents=True, exist_ok=True)
            (output / page).write_text(
                f'<!doctype html><html lang="en"><meta charset="utf-8"><title>{title}</title>'
                '<style>:target { background: #fff2b3 }</style>'
                f'<h1>{title}</h1><pre>{listing}</pre>\n', encoding="utf-8"
            )

        missing = sorted(
            name for name in requested - links.keys() if name.startswith("SectionsAndConnections.")
        )
        if missing:
            raise ValueError("Missing local Lean declarations: " + ", ".join(missing))
        for graph in document.userdata["dep_graph"]["graphs"].values():
            for node in graph.nodes:
                node.userdata["lean_urls"] = [
                    (name, links.get(name, url)) for name, url in node.userdata["lean_urls"]
                ]

    # leanblueprint 0.0.20 fills lean_urls at priority 150.
    document.addPostParseCallbacks(151, link_sources)
