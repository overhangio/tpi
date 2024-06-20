# TPI: Tutor Plugin Indexes

This is the repository for the official [Tutor](https://docs.tutor.edly.io/) plugin indexes maintained by [Edly](https://edly.io). A Tutor plugin index is similar to the Python Package index ([PyPi](https://pypi.org/)) or an `apt` repository: it is a reference to many plugins that can then be easily installed and enabled by Tutor.

For more information about plugin indexes, check out the [Tutor official documentation](https://docs.tutor.edly.io/reference/indexes.html).

## Cheatsheet

Install the "notes" plugin from the main index, which is enabled by default:

    tutor plugins install notes

Add the contrib index:

    tutor plugins index add contrib

Install the codejail plugin from the contrib index:

    tutor plugins install codejail

Upgrade all plugins:

    tutor plugins upgrade all

## Indexes

Two indexes are stored in this repo: [main](#main) and [contrib](#contrib).

### <a name="main"></a>main

This is the index for the free, open source plugins that are officially maintained by [Edly](https://edly.io). Major releases for these plugins are published prior to every major Open edX release, following the official [release schedule](https://openedx.atlassian.net/wiki/spaces/COMM/pages/3613392957/Open+edX+release+schedule).

### <a name="contrib"></a>contrib

This index references plugins from 3rd-party individuals and companies. New entries are welcome! Are you the maintainer of a Tutor plugin that you would like to share with the rest of the world? Then please open a pull request to this repository. Unit tests will automatically check the validity of your changes.

New "plugins.yml" files will be created for every release, every six months. Plugin maintainers are expected to open new pull requests to add their plugins to the contrib index shortly after each release.

# Development

To test the validity of your changes to the plugin indexes, run:

    make test

Depending on your environment, you might have to install test requirements:

    make test-requirements

# Troubleshooting

These indexes are maintained by [Edly](https://edly.io). Community support is available from the official [Open edX forum](https://discuss.openedx.org).

## License

This work is licensed under the terms of the [GNU Affero General Public License (AGPL)](https://github.com/overhangio/tpi/blob/master/LICENSE.txt).
