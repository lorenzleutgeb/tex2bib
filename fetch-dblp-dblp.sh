#! /usr/bin/env bash
set -euo pipefail
curl --fail --silent https://dblp.org/rec/${1}.bib?param=1
