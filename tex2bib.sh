#! /usr/bin/env bash

set -euo pipefail

touch $TARGET

FETCH="0"

TMP=$(mktemp -d)

grep -Poh ".cite\{\K(([A-Za-z]+:[a-zA-Z0-9\-\/\.]+),?)+" *.tex | sed 's/,/\n/g' | sed '/^$/d' | sort | uniq > $TMP/all
echo "GREPD $(cat $TMP/all | wc -l) records, temporarily written to $TMP/all"

while read REC
do
	SCHEME=$(echo "$REC" | cut -d':' -f1)
	REST=$(echo "$REC" | cut -d':' -f2-)
	if ! grep -q "$REST" $TARGET
	then
		echo "FETCH $REC"
		FETCH="1"

		for FETCHER in $(ls -1 fetch-*-${SCHEME,,}.sh)
		do
			TMP_REC=$(mktemp)
			if ./$FETCHER $REST | bibtool -f $REC -o $TMP_REC
			then
				cat $TMP_REC >> $TARGET
			else
				echo "$REC" >> $TMP/error
				echo "ERROR $REC"
			fi
		done
	else
		echo "FOUND $REC"
	fi

done < $TMP

if [ "$FETCH" == "0" ]
then
	echo "FOUND ALL"
	rm -fv $TMP
	exit 0
fi

cp -v $TARGET $TMP

bibtool -r merge.rsc -i $TARGET -o $TMP

cat > $TARGET <<EOH
% This file was automatically generated. Do not edit it manually.
% Program:  $0
% Date:     $(date --iso-8601=minutes)
EOH

cat $TMP >> $TARGET

rm -frv $TMP
