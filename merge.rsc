count.used=on
preserve.key.case=on
sort=on
verbose=on

# Remove URL if it looks like a DOI.
rewrite.rule { url # "https://doi.org/" }

# Remove escape sequence for underscore in DOIs.
# splncs04 handles underscores well and will
# choke if fed escaped underscores.
rewrite.rule { doi # "\\_" = "_" }
