#! /usr/bin/env bash
set -euo pipefail
curl --fail --silent --location --header "Accept: application/x-bibtex; charset=utf-8" https://doi.org/${1}
