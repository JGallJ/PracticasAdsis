#!/bin/bash
#868801, Gallardo Jaso , Jorge, [T], [1], [A]
#869402, Baldovin Cotela, Enrique, [T], [1], [A]

fichero="$1"
if [ "$#" -ne 1 ]
then
	echo "Sintaxis: practica2_3.sh <nombre_archivo>"
	exit 1
fi

if [ ! -e "$fichero" ]
then
	echo "$fichero no existe"
	exit 1
fi

if [ -f "$fichero" ]
then
	chmod ug+x "$fichero"
	permisos=$(stat -c "%A" "$fichero")
	echo "$permisos"
fi

