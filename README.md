# tex2bib

A very simple Bash script that

 * extracts citation keys from `*.tex` files.
 * looks up these keys in bibliographic databases
   (DBLP, arXiv, Crossref, inspirehep)
 * generates a `*.bib` for all citations that could
   be identified. Tells you which are still missing.

The main entry point is `tex2bib.sh`, and fetchers are
named according to the pattern `fetch-${PLATFORM}-${SCHEMA}.sh`.

## Similar Software

 * https://github.com/rhomu/tex2bib
 * https://github.com/nathangrigg/arxiv2bib
 * https://github.com/cpitclaudel/biblio.el
 * https://arxiv.org/help/api/basics#projects-using-the-api
