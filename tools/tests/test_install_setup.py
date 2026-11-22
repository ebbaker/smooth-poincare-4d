import importlib.util
from pathlib import Path
import tempfile
import unittest

spec = importlib.util.spec_from_file_location('install_setup', Path(__file__).resolve().parents[1] / 'install_setup.py')
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)

class InstallerSafetyTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.source = Path(self.temp.name).resolve() / 'source'
        self.destination = Path(self.temp.name).resolve() / 'destination'
        self.source.mkdir()
        self.destination.mkdir()

    def test_conflict_stops_all_copies(self):
        (self.source / 'new.txt').write_text('new')
        (self.source / 'existing.txt').write_text('changed')
        (self.destination / 'existing.txt').write_text('original')
        with self.assertRaises(ValueError): module.plan(self.source, self.destination)
        self.assertFalse((self.destination / 'new.txt').exists())
        self.assertEqual((self.destination / 'existing.txt').read_text(), 'original')

    def test_idempotent_copy_preserves_git(self):
        (self.source / 'source.txt').write_text('content')
        (self.destination / '.git').mkdir()
        (self.destination / '.git/config').write_text('sentinel')
        pending, identical = module.plan(self.source, self.destination)
        self.assertEqual(len(pending), 1)
        module.apply(pending)
        pending, identical = module.plan(self.source, self.destination)
        self.assertFalse(pending)
        self.assertEqual(len(identical), 1)
        self.assertEqual((self.destination / '.git/config').read_text(), 'sentinel')

    def test_symlink_parent_rejected(self):
        (self.source / 'sub').mkdir()
        (self.source / 'sub/data.txt').write_text('content')
        (self.destination / 'sub').symlink_to(self.source / 'sub', target_is_directory=True)
        with self.assertRaises(ValueError): module.plan(self.source, self.destination)

    def test_racing_existing_file_is_not_overwritten(self):
        (self.source / 'data.txt').write_text('content')
        pending, _ = module.plan(self.source, self.destination)
        (self.destination / 'data.txt').write_text('new work')
        with self.assertRaises(FileExistsError): module.apply(pending)
        self.assertEqual((self.destination / 'data.txt').read_text(), 'new work')

if __name__ == '__main__':
    unittest.main()
