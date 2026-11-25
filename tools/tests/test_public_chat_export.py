#!/usr/bin/env python3
"""Public archive fidelity and duplicate protection for account exports."""
from pathlib import Path
import json
import shutil
import sys
import tempfile
import unittest

TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))
import import_public_chat_export as exporter
import refresh_chat_history as history


def message(ident, parent, role, time, text, metadata=None, kind="text"):
    return {"id": ident, "parent": parent, "message": {
        "id": ident, "author": {"role": role, "name": None}, "create_time": time,
        "content": {"content_type": kind, "parts": [text]}, "metadata": metadata or {},
    }}


def fixture():
    return {"title": "Fixture discussion", "id": "fixture-chat", "create_time": 999.5,
            "update_time": 1005.9, "current_node": "answer", "mapping": {
                "export-root": {"id": "export-root", "parent": None, "message": None},
                "user": message("user", "export-root", "user", 1000.2, "A question.", {
                    "attachments": [{"id": "file-fixture", "name": "paper.pdf",
                                     "mime_type": "application/pdf", "size": 100, "file_token_size": 9}],
                }),
                "scratch": message("scratch", "user", "assistant", 1002, "PRIVATE-THOUGHT", kind="thoughts"),
                "answer": message("answer", "scratch", "assistant", 1005.2, "The selected answer.", {
                    "content_references": [
                        {"type": "hidden", "alt": "PRIVATE-CITATION"},
                        {"type": "file", "name": "paper.pdf", "snippet": "PRIVATE-TOOL-CONTENT"},
                    ],
                }),
                "alternative": message("alternative", "user", "assistant", 1004.3, "An alternative answer."),
            }}


class ExportTests(unittest.TestCase):
    def test_keeps_source_ids_times_branches_and_public_attachment_label(self):
        chat = exporter.public_conversation(fixture(), "conversations-000.json", "a" * 64)
        nodes = chat["mapping"]
        self.assertEqual(chat["create_time"], 999.5)
        self.assertEqual(chat["current_node"], "answer")
        self.assertEqual(nodes["user"]["children"], ["alternative", "answer"])
        self.assertEqual(nodes["answer"]["parent"], "user")
        self.assertEqual(nodes["answer"]["message"]["create_time"], 1005.2)
        self.assertEqual(nodes["user"]["message"]["metadata"]["attachments"], [
            {"id": "file-fixture", "name": "paper.pdf", "mime_type": "application/pdf", "size": 100},
        ])
        self.assertNotIn("PRIVATE-", json.dumps(chat))

    def test_unsupported_public_content_is_rejected(self):
        chat = fixture()
        chat["mapping"]["user"]["message"]["content"]["parts"].append({"type": "image"})
        with self.assertRaisesRegex(ValueError, "Unsupported public message"):
            exporter.public_conversation(chat, "conversations-000.json", "a" * 64)

    def test_early_registry_is_discoverable_and_prevents_duplicate_import(self):
        with tempfile.TemporaryDirectory() as temp:
            repo = Path(temp).resolve()
            for name in ("papers", "tools", "chat-histories"):
                (repo / name).mkdir()
            shutil.copyfile(TOOLS / "record_chat.py", repo / "tools/record_chat.py")
            chat = exporter.public_conversation(fixture(), "conversations-000.json", "a" * 64)
            entry = exporter.register(repo, "chat-histories/early-chats", chat)
            early = repo / "chat-histories/early-chats"
            self.assertEqual(history.find_registered(repo, "fixture-chat"), early)
            self.assertEqual(history.current_hash(early / entry["file"]), entry["sha256"])
            with self.assertRaisesRegex(ValueError, "already has a canonical registration"):
                exporter.register(repo, "chat-histories", chat)
            self.assertFalse((repo / "chat-histories/index.json").exists())


if __name__ == "__main__":
    unittest.main()
