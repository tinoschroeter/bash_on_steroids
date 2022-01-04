#!/bin/bash
#
# apt install aspell aspell-de aspell-en
#
# aspell -l de -c test.txt // check file
# aspell -l en -a          // check individual words

if [ -z "$1" ]; then
  echo Example: $0 en
  exit 1
fi

for f in **/*.md; do
	aspell --home-dir=. check -d $1 $f
done

