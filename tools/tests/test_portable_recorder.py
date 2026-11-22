"""Check CLI destinations after relocating the shared recorder to tools/."""
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

RECORDER = Path(__file__).resolve().parents[1] / "record_chat.py"


class PortableRecorderTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="portable-recorder-")
        self.root = Path(self.temp.name)
        self.repo = self.root / "repo"
        (self.repo / "tools").mkdir(parents=True)
        shutil.copyfile(RECORDER, self.repo / "tools/record_chat.py")
        self.source = self.root / "synthetic-conversation.json"
        self.source.write_text(json.dumps({
            "id": "synthetic-import-id", "conversation_id": "synthetic-import-id",
            "title": "Synthetic destination check", "create_time": 1000,
            "update_time": 1001, "current_node": "message-1",
            "mapping": {"message-1": {"id": "message-1", "parent": None,
                "children": [], "message": {"id": "message-1",
                "author": {"role": "user"}, "create_time": 1000,
                "update_time": 1001, "content": {"content_type": "text",
                "parts": ["Synthetic public message"]}}}}
        }))

    def tearDown(self):
        self.temp.cleanup()

    def run_import(self, *arguments):
        result = subprocess.run([sys.executable, str(self.repo / "tools/record_chat.py"),
            "--import-json", str(self.source), *arguments], cwd=self.root,
            env=dict(os.environ, PYTHONDONTWRITEBYTECODE="1"),
            text=True, capture_output=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        return json.loads(result.stdout)

    def test_default_archive_is_at_repository_root(self):
        result = self.run_import()
        archive = self.repo / "chat-histories" / result["file"]
        self.assertTrue(archive.is_file())
        self.assertFalse((self.repo / "tools/chat-histories").exists())
        self.assertEqual(json.loads(archive.read_text())[0]["conversation_id"],
                         "synthetic-import-id")

    def test_named_project_archive_is_under_investigations(self):
        project = self.repo / "papers/investigations-1/synthetic_project"
        for folder in ["notes", "numerics", "reviews"]:
            (project / folder).mkdir(parents=True)
        (project / "README.md").write_text("# Synthetic fixture\n")
        result = self.run_import("--project", "synthetic_project")
        self.assertTrue((project / "chat-histories" / result["file"]).is_file())
        self.assertFalse((self.repo / "chat-histories").exists())

    def test_initial_series_selection_does_not_capture_into_same_named_current_branch(self):
        for series in ("investigations-1", "initial-investigations"):
            project = self.repo / "papers" / series / "same_name"
            for folder in ("notes", "numerics", "reviews"):
                (project / folder).mkdir(parents=True)
            (project / "README.md").write_text("# Synthetic fixture\n")
        result = self.run_import("--project", "same_name", "--series", "initial-investigations")
        expected = self.repo / "papers/initial-investigations/same_name/chat-histories" / result["file"]
        self.assertTrue(expected.is_file())
        self.assertFalse((self.repo / "papers/investigations-1/same_name/chat-histories").exists())

    def test_initial_series_without_project_is_rejected_before_writing(self):
        result = subprocess.run([sys.executable, str(self.repo / "tools/record_chat.py"),
            "--import-json", str(self.source), "--series", "initial-investigations"],
            cwd=self.root, text=True, capture_output=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("requires --project", result.stderr)
        self.assertFalse((self.repo / "chat-histories").exists())


if __name__ == "__main__":
    unittest.main()
