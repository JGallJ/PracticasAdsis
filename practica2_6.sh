#!/bin/bash
#868801, Gallardo Jaso, Jorge, T, 1, A
#869402, Baldovin Cotela, Enrique, T, 1, A

dir=""
fecha_m=0

#si hay otro directorio bin se escoge el menos modificado
for leido in $( stat -c %n,%Y $HOME/bin[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9] 2> /dev/null )
do
	dest=$(echo "$leido"| cut -d ',' -f1)
	fecha=$(echo "$leido" | cut -d ',' -f2)
	fecha_num=$(("$fecha"))
	if [ "$fecha_num" -le "$fecha_m" -o "$fecha_m" -eq 0 ]
	then
		fecha_m="$fecha_num"
		dir="$dest"
	fi
done

#si no existia ningun directorio bin crea uno nuevo
if [  ! "$dir" ]
then
	dir=$( mktemp -d $HOME/binXXX )
	echo Se ha creado el directorio "$dir"
fi
echo "Directorio destino de copia: $dir"
count=0

#recorremos todos los ficheros y seleccionamos los que no son directorios y tienen permiso de ejecucion
for var in $( ls )
do
	if [ ! -d "$var" -a  -x "$var" ]
	then
		echo "./$var ha sido copiado a $dir"
		cp "$var" "$dir"
		count=$(( "$count" + 1 ))
	fi
done

if [ "$count" -eq 0 ]
then
	echo "No se ha copiado ningun archivo"
else
	echo "Se han copiado $count archivos"
fi
