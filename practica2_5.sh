#!/bin/bash
#868801, Gallardo Jaso, Jorge, T, 1, A
#869402, Baldovin Cotela, Enrique, T, 1, A

read -p "Introduzca el nombre de un directorio: " dir
if [ ! -d "$dir" ]
then
	echo "$dir no es un directorio"
	exit 1
fi

num_archivos=$( find "$dir" -maxdepth 1 -type f | wc -l)
num_directorios=$( find "$dir" -maxdepth 1 -type d | wc -l)
#decrementamos en uno para eliminar el directorio que apunta al anterior
num_directorios=$(( "$num_directorios" - 1 ))
echo "El numero de ficheros y directorios en $dir es de $num_archivos y $num_directorios, respectivamente"
