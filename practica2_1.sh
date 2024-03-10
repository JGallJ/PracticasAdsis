#!/bin/bash
#868801, Gallardo Jaso, Jorge, T, 1, A
#869402, Baldovin Cotela, Enrique, T, 1, A

echo -n "Introduzca el nombre del fichero: "

read fich
if [ -e "$fich" ]
then
	echo -n "Los permisos del archivo $fich son: "
	if [ -r "$fich" ]
	then
		echo -n r
	else
		echo -n -
	fi

	if [ -w "$fich" ]
	then
		echo -n w
	else
		echo -n -
	fi

	if [ -x "$fich" ]
	then
		echo x
	else
		echo -
	fi
else
	echo "$fich" no existe
fi
