#!/usr/bin/env python3
"""Register one verified conversation from a reduced ChatGPT account export."""
from __future__ import annotations

import argparse
from collections import Counter, defaultdict
from datetime import datetime, timezone
import json
import math
from pathlib import Path
import re

from extract_project_chats import conversation_id, conversation_list
import refresh_chat_history as history

SOURCE_KIND = "ChatGPT account export; public text"
METADATA_FIELDS = {
    "attachments", "content_references", "image_results", "message_locale",
    "model_slug", "parent_id", "search_result_groups", "serialization_metadata",
}


def timestamp(value):
    if isinstance(value, bool) or not isinstance(value, (int, float)) or not math.isfinite(value) or value < 0:
        raise ValueError("Invalid recorded timestamp in the ChatGPT export")
    return value


def attachment_descriptor(attachment):
    fields = ("id", "name", "mime_type")
    dimensions = ("width", "height")
    if (not isinstance(attachment, dict)
            or set(attachment) - {*fields, *dimensions, "size", "file_token_size",
                                  "is_big_paste", "source", "library_file_id"}
            or any(not isinstance(attachment.get(key), str) for key in fields)
            or attachment.get("is_big_paste", False) is not False
            or type(attachment.get("size")) is not int or attachment["size"] < 0):
        raise ValueError("Unsupported attachment in the ChatGPT export")
    if "library_file_id" in attachment and not isinstance(attachment["library_file_id"], str):
        raise ValueError("Invalid library attachment identity in the ChatGPT export")
    descriptor = {key: attachment[key] for key in (*fields, "size")}
    if any(key in attachment for key in dimensions):
        if (not attachment["mime_type"].startswith("image/")
                or any(type(attachment.get(key)) is not int or attachment[key] <= 0 for key in dimensions)):
            raise ValueError("Invalid image dimensions in the ChatGPT export")
        descriptor.update({key: attachment[key] for key in dimensions})
    return descriptor


def inline_image_descriptor(part, attachments):
    fields = ("content_type", "asset_pointer", "width", "height", "size_bytes")
    if (not isinstance(part, dict) or part.get("content_type") != "image_asset_pointer"
            or set(part) - {*fields, "fovea", "metadata"} or part.get("fovea") is not None):
        raise ValueError("Unsupported inline public content in the ChatGPT export")
    pointer = part.get("asset_pointer")
    match = re.fullmatch(r"sediment://(file_[0-9a-f]{32})", pointer) if isinstance(pointer, str) else None
    if not match or any(type(part.get(key)) is not int or part[key] <= 0 for key in fields[2:]):
        raise ValueError("Invalid inline image descriptor in the ChatGPT export")
    metadata = part.get("metadata")
    if metadata is not None and (not isinstance(metadata, dict) or any(
            value is not None and (key != "sanitized" or not isinstance(value, bool))
            for key, value in metadata.items())):
        raise ValueError("Unsupported inline image metadata in the ChatGPT export")
    matches = [a for a in attachments if a["id"] == match[1]]
    if len(matches) != 1:
        raise ValueError("Inline image lacks its matching exported attachment")
    attachment = matches[0]
    if (not attachment["mime_type"].startswith("image/") or attachment["size"] != part["size_bytes"]
            or any(attachment.get(key) != part[key] for key in ("width", "height"))):
        raise ValueError("Inline image and attachment descriptors disagree")
    return {key: part[key] for key in fields}


def public_message(message):
    role = message["author"]["role"]
    content = message["content"]
    if role in {"system", "developer", "tool"}:
        return None
    if role == "assistant" and content["content_type"] in {"thoughts", "reasoning_recap"}:
        return None
    metadata = message.get("metadata", {})
    # Only this reduced export form makes text visibility unambiguous here.
    if (role not in {"user", "assistant"} or set(message["author"]) - {"role", "name"}
            or message["author"].get("name") is not None
            or set(message) - {"id", "author", "create_time", "content", "metadata"}
            or set(content) != {"content_type", "parts"} or not isinstance(content["parts"], list)
            or not isinstance(metadata, dict) or set(metadata) - METADATA_FIELDS):
        raise ValueError("Unsupported public message structure in the ChatGPT export")
    public_metadata = {}
    if "model_slug" in metadata and isinstance(metadata["model_slug"], str):
        public_metadata["model_slug"] = metadata["model_slug"]
    attachments = metadata.get("attachments", [])
    references = metadata.get("content_references", [])
    if (not isinstance(attachments, list) or not isinstance(references, list)
            or any(not isinstance(ref, dict) or not isinstance(ref.get("type"), str) for ref in references)):
        raise ValueError("Malformed ChatGPT export references")
    descriptors = [attachment_descriptor(a) for a in attachments]
    if descriptors:
        public_metadata["attachments"] = descriptors
    if role == "user" and content["content_type"] == "multimodal_text":
        content = {"content_type": "multimodal_text",
                   "parts": [part if isinstance(part, str) else inline_image_descriptor(part, descriptors)
                             for part in content["parts"]]}
    elif content["content_type"] != "text" or not all(isinstance(part, str) for part in content["parts"]):
        raise ValueError("Unsupported public message structure in the ChatGPT export")
    # Preserve displayed citation labels, excluding hidden and runtime fields.
    labels = [{key: ref[key] for key in ("type", "name", "alt") if isinstance(ref.get(key), str)}
              for ref in references if ref["type"] != "hidden"]
    if labels:
        public_metadata["content_reference_labels"] = labels
    return {"id": message["id"], "author": {"role": role, "name": None},
            "create_time": timestamp(message["create_time"]), "content": content,
            "metadata": public_metadata}


def public_conversation(chat, source_name, source_sha256):
    """Keep all exported public branches with their message IDs and original times."""
    original = chat["mapping"]
    children = defaultdict(list)
    for key, node in original.items():
        parent = node.get("parent")
        if (set(node) != {"id", "parent", "message"} or node["id"] != key
                or (parent is not None and parent not in original)):
            raise ValueError("Malformed ChatGPT export tree")
        children[parent].append(key)
    roots = children[None]
    if len(roots) != 1 or original[roots[0]].get("message") is not None:
        raise ValueError("Expected exactly one empty ChatGPT export root")
    root = roots[0]
    mapping = {root: {"id": root, "parent": None, "children": [], "message": None}}
    nearest_public, omitted = {}, Counter()
    pending = [(root, root)]
    while pending:
        key, parent = pending.pop()
        if key in nearest_public:
            raise ValueError("Repeated node in the ChatGPT export tree")
        message = original[key].get("message")
        if message is not None:
            if message.get("id") != key:
                raise ValueError("Conflicting message identity in the ChatGPT export")
            shown = public_message(message)
            if shown is None:
                omitted[message["author"]["role"], message["content"]["content_type"]] += 1
            else:
                mapping[key] = {"id": key, "parent": parent, "children": [], "message": shown}
                mapping[parent]["children"].append(key)
                parent = key
        elif key != root:
            raise ValueError("Unexpected empty node in the ChatGPT export")
        nearest_public[key] = parent
        pending.extend((child, parent) for child in children[key])
    if len(nearest_public) != len(original) or len(mapping) < 2 or chat["current_node"] not in nearest_public:
        raise ValueError("Empty or disconnected ChatGPT export tree")
    for node in mapping.values():
        node["children"].sort(key=lambda child: (mapping[child]["message"]["create_time"], child))
    ident = conversation_id(chat)
    if not isinstance(ident, str) or not ident or not isinstance(chat["title"], str) or not chat["title"].strip():
        raise ValueError("The ChatGPT export has no usable conversation identity or title")
    return {
        "id": ident, "conversation_id": ident, "title": chat["title"],
        "create_time": timestamp(chat["create_time"]), "update_time": timestamp(chat["update_time"]),
        "current_node": nearest_public[chat["current_node"]], "mapping": mapping,
        "archive_metadata": {
            "format": "ChatGPT-style mapping of public export text",
            "source_kind": SOURCE_KIND,
            "source_file": source_name,
            "source_sha256": source_sha256,
            "source_project_id": chat.get("conversation_template_id"),
            "coverage": "User and assistant text in the supplied snapshot, including exported alternate branches. "
                        "The export does not mark commentary, turn completion or per-message update times.",
            "attachment_coverage": "File and inline image descriptors and reference labels only. "
                                   "No binary attachments, embedded media or expanded reference and search data.",
            "omitted_source_records": {f"{role}/{kind}": count for (role, kind), count in sorted(omitted.items())},
        },
    }


def register(repo, folder, conversation):
    repo = Path(repo).resolve()
    folder = history.safe_directory(repo, folder)
    ident = conversation["conversation_id"]
    recorder = history.load_recorder(repo)
    with history.registry_lock(folder, 10):
        history.recover_transaction(folder)
        if history.find_registered(repo, ident) is not None:
            raise ValueError("This conversation already has a canonical registration")
        index = history.read_index(folder)
        captured = datetime.now(timezone.utc)
        conversation["archive_metadata"].update(
            first_captured_at_utc=recorder.iso(captured.timestamp()),
            first_captured_at_local=captured.astimezone(recorder.LOCAL).isoformat(timespec="milliseconds"),
        )
        return history.install_capture(folder, index, None, conversation, recorder, captured.timestamp())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--export", required=True, type=Path, help="One conversations*.json chunk")
    parser.add_argument("--conversation-id", required=True, help="Verified original ChatGPT conversation ID")
    parser.add_argument("--history-dir", required=True, help="Repository-relative history registry")
    args = parser.parse_args()
    try:
        data = args.export.read_bytes()
        matches = [c for c in conversation_list(json.loads(data)) if conversation_id(c) == args.conversation_id]
        if len(matches) != 1:
            raise ValueError("Expected exactly one conversation with the requested export ID")
        chat = public_conversation(matches[0], args.export.name, history.sha(data))
        entry = register(Path(__file__).resolve().parents[1], args.history_dir, chat)
    except (history.HistoryError, KeyError, TypeError, ValueError, OSError, OverflowError):
        # Do not expose raw account export contents in diagnostics.
        raise SystemExit("Public export import failed validation, duplication, size or registry checks.") from None
    print(json.dumps({key: entry[key] for key in ("number", "file", "message_count", "sha256")}))


if __name__ == "__main__":
    main()
