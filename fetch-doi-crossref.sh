#! /usr/bin/env bash
set -euo pipefail
curl --fail --silent --location "http://search.crossref.org/citation?format=bibtex&doi=$1"
