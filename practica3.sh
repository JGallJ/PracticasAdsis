#!/bin/bash
#868801, Gallardo Jaso, Jorge, T, 1, A
#869402, Baldovin Cotela, Enrique, T, 1, A

#a
if [ "$(id -u)" != "0" ]; then
    echo "Este script necesita privilegios de administración"
    exit 1
fi

#d
if [ "$#" -ne 2 ]; then
    echo "Numero incorrecto de argumentos" >&2
    exit 1
fi

#e, i, j, o, p, q, r
if [ "$1" = "-s" ]; then
    while IFS=, read -r username _ _ || [[ -n "$username" ]]; do
        # Verificar si el usuario existe y borrarlo
        if id "$username" &>/dev/null; then

            #Si no existe creamos el directorio extra
            if [ ! -d "/extra" ]; then
                mkdir -p "/extra"
            fi

            #Si no existe creamos el directorio backup dentro de extra
            if [ ! -d "/extra/backup" ]; then
                mkdir -p "/extra/backup"
            fi

            # Crear el archivo de respaldo usando tar
            #tar -c -f "/extra/backup/$username.tar" -C "/home/" "$username" &>/dev/null
            #tar -c -f "/extra/backup/$username.tar" -C "/home/$username/" "$username" &>/dev/null

            #Si el backup no se puede crear, el usuario no se borrara
            if  tar -c -f "/extra/backup/$username.tar" -C "/home/$username/" "$username" &>/dev/null ; then
                userdel -r "$username"
            fi

        fi
    done <"$2"

#f, g, h, j, k, l, m, n
elif [ "$1" = "-a" ]; then
    while IFS=, read -r username password full_name; do
        if [ -z "$username" ] || [ -z "$password" ] || [ -z "$full_name" ]; then
            echo "Campo invalido"
            exit 1
        fi
        # Añadir usuario si no existe
        if ! id "$username" &>/dev/null; then
            useradd -m -c "$full_name" -U -K UID_MIN=1815 -K PASS_MAX_DAYS=30 "$username" -k /etc/skel &>/dev/null
            echo "$username:$password" | chpasswd &>/dev/null
            usermod -f 30 "$username" &>/dev/null
            echo "$full_name ha sido creado"
        else
            echo "El usuario $username ya existe"
        fi
    done <"$2"

#c
else
    echo "Opcion invalida" >&2
fi
