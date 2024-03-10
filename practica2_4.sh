#!/bin/bash
#868801, Gallardo Jaso , Jorge, [T], [1], [A]
#869402, Baldovin Cotela, Enrique, [T], [1], [A]

IFS=
read -r -p "Introduzca una tecla: " letra
letra2=${letra:0:1}

case ${letra:0:1} in
	[[:alpha:]])
		echo $letra2 es una letra ;;
	[[:digit:]])
		echo $letra2 es un numero ;;
	*)
		echo $letra2 es un caracter especial ;;
esac
