from __future__ import annotations

import os
import typing as t
import unittest
import yaml

ROOT_DIR = os.path.dirname(__file__)
RELEASES = os.listdir(os.path.join(ROOT_DIR, "main"))
INDEXES = ["main", "wizard", "contrib"]


class IndexTests(unittest.TestCase):
    def test_releases_exist(self) -> None:
        for release in RELEASES:
            for index in INDEXES:
                path = index_path(release, index)
                self.assertTrue(os.path.isfile(path), f"Missing index: {path}")

    def test_names_are_unique(self) -> None:
        for release in RELEASES:
            names: t.Set[str] = set()
            for index in INDEXES:
                for plugin in load_index(release, index):
                    self.assertNotIn(
                        plugin["name"],
                        names,
                        f"Duplicate plugin name '{plugin['name']}' found in release {release}",
                    )
                    names.add(plugin["name"])

    def test_all_plugins_have_all_fields(self) -> None:
        for release in RELEASES:
            for index in INDEXES:
                for plugin in load_index(release, index):
                    self.assertIn("src", plugin)
                    self.assertIn("url", plugin)
                    self.assertIn("author", plugin)
                    self.assertIn("maintainer", plugin)
                    self.assertIn("description", plugin)


def load_index(release: str, index: str) -> list[dict[str, str]]:
    with open(index_path(release, index), encoding="utf8") as f:
        index = yaml.safe_load(f)
        assert isinstance(index, list)
    return index


def index_path(release: str, index: str) -> str:
    return os.path.join(ROOT_DIR, index, release, "plugins.yml")
