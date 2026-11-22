"""Check explicit series routing at the Cowork/recorder boundary."""
from pathlib import Path
import runpy
from types import SimpleNamespace
import unittest
from unittest.mock import patch


COWORK = runpy.run_path(str(Path(__file__).resolve().parents[1] / "record_Claude_cowork_chat.py"))


class CoworkSeriesRoutingTests(unittest.TestCase):
    def test_series_changes_only_project_destination(self):
        registry = COWORK["registry_folder"]
        root = COWORK["ROOT"]
        for series in ("investigations-1", "initial-investigations"):
            args = SimpleNamespace(project="same_name", folder=None, series=series)
            self.assertEqual(registry(args), root / "papers" / series / "same_name/chat-histories")
        self.assertEqual(registry(SimpleNamespace(project=None, folder=None)), root / "chat-histories")

    def test_explicit_history_folder_remains_authoritative(self):
        requested = Path("/tmp/synthetic-public-archive")
        args = SimpleNamespace(project=None, folder=str(requested), series="investigations-1")
        self.assertEqual(COWORK["registry_folder"](args), requested)

    def test_import_forwards_initial_series_to_shared_recorder(self):
        args = SimpleNamespace(recorder=None, project="01_generalized_isothermal_coordinates",
                               folder=None, series="initial-investigations", allow_shorter_refresh=False)
        with patch.object(COWORK["subprocess"], "run", return_value=SimpleNamespace(returncode=0)) as run:
            COWORK["import_with_recorder"](b"[]", args)
        command = run.call_args.args[0]
        self.assertEqual(command[command.index("--series") + 1], "initial-investigations")
        self.assertEqual(command[command.index("--project") + 1], args.project)


if __name__ == "__main__":
    unittest.main()
