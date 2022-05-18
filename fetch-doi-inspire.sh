#! /usr/bin/env bash
set -euo pipefail
curl --fail --silent --header 'Accept: application/x-bibtex' "https://inspirehep.net/api/doi/${1}"
