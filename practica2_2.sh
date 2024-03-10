#!/bin/bash
#868801, Gallardo Jaso, Jorge, T, 1, A
#869402, Baldovin Cotela, Enrique, T, 1, A

for file in "$@"
do
	if [ -f "$file" ]
	then
		more "$file"
	else
		echo "$file no es un fichero"
	fi
done
