"""Compile the pole-form manuscript with the shared bibliography and its pending records."""

import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
SOURCE = HERE / "chiral_transfer_and_pole_forms.tex"
BIBLIOGRAPHY = ROOT / "references/references.bib"
SUPPLEMENT = HERE.parents[1] / "05_certificates/references/SHARED_BIBLIOGRAPHY_20261127.patch"
PDF_DIR = ROOT / "output/pdf" / HERE.parent.name


def bibliography_for_draft():
    canonical = BIBLIOGRAPHY.read_text()
    groups = re.findall(r"\\cite(?:\[[^\]]*\])?\{([^}]*)\}", SOURCE.read_text())
    cited = {key.strip() for group in groups for key in group.split(",")}
    present = set(re.findall(r"(?m)^@\w+\s*\{\s*([^,\s]+),", canonical))
    missing = cited - present
    if not missing:
        return canonical

    # Use only complete new records from CERT's checked patch. Once a record
    # enters the shared file, the canonical copy automatically takes precedence.
    additions = "\n".join(line[1:] for line in SUPPLEMENT.read_text().splitlines()
                          if line.startswith("+") and not line.startswith("+++"))
    for entry in re.finditer(r"(?ms)^@\w+\{\s*([^,\s]+),.*?^\}[ \t]*$", additions):
        if entry[1] in missing:
            canonical += "\n" + entry[0] + "\n"
            missing.remove(entry[1])
    if missing:
        raise ValueError("Missing source records: " + ", ".join(sorted(missing)))
    return canonical


def main():
    with tempfile.TemporaryDirectory(prefix="chiral-pole-") as directory:
        work = Path(directory)
        (work / "references.bib").write_text(bibliography_for_draft())
        env = os.environ.copy()
        env["BIBINPUTS"] = os.pathsep.join((str(work), env.get("BIBINPUTS", "")))
        command = ["latexmk", "-pdf", "-interaction=nonstopmode", "-halt-on-error",
                   "-file-line-error", "-outdir=" + str(work), str(SOURCE)]
        subprocess.run(command, cwd=HERE, env=env, check=True)
        log = (work / SOURCE.with_suffix(".log").name).read_text()
        if re.search(r"(?:Citation|Reference) .* undefined|There were undefined", log):
            raise RuntimeError("Unresolved reference in manuscript")
        PDF_DIR.mkdir(parents=True, exist_ok=True)
        pdf = PDF_DIR / SOURCE.with_suffix(".pdf").name
        shutil.copy2(work / pdf.name, pdf)
        print(pdf)


if __name__ == "__main__":
    main()
