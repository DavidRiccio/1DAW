#!/bin/bash

# Función para mostrar el menú
show_menu() {
    echo "--------------"
    echo "---- Menú ----"
    echo "--------------"
    echo "1) Añadir usuario"
    echo "2) Cambiar contraseña"
    echo "3) Agregar a un grupo"
    echo "4) Eliminar de un grupo"
    echo "5) Eliminar usuario"
    echo "6) Crear grupo nuevo"
    echo "7) Borrar grupo"
    echo "8) Salir"
}

# Función para añadir un usuario
add_user() {
    read -p "Introduce el nombre de usuario a añadir: " username
    if [ -z "$username" ]; then
        echo "Nombre de usuario no válido."
        return
    fi
    sudo adduser --force-badname $username
}

# Función para cambiar la contraseña de un usuario
change_password() {
    read -p "Introduce el nombre de usuario cuya contraseña quieres cambiar: " username
    if [ -z "$username" ]; then
        echo "Nombre de usuario no válido."
        return
    fi
    sudo passwd $username
}

# Función para agregar un usuario a un grupo
add_to_group() {
    read -p "Introduce el nombre de usuario: " username
    if [ -z "$username" ]; then
        echo "Nombre de usuario no válido."
        return
    fi
    read -p "Introduce el nombre del grupo al que deseas agregarlo: " groupname
    if [ -z "$groupname" ]; then
        echo "Nombre de grupo no válido."
        return
    fi
    sudo usermod -aG $groupname $username
}

# Función para eliminar un usuario de un grupo
remove_from_group() {
    read -p "Introduce el nombre de usuario: " username
    if [ -z "$username" ]; then
        echo "Nombre de usuario no válido."
        return
    fi
    read -p "Introduce el nombre del grupo del que deseas eliminarlo: " groupname
    if [ -z "$groupname" ]; then
        echo "Nombre de grupo no válido."
        return
    fi
    sudo deluser $username $groupname
}

# Función para eliminar un usuario
remove_user() {
    echo "Usuarios:"
    cat /etc/passwd | cut -d: -f1
    read -p "Introduce el nombre de usuario a eliminar: " username
    if [ -z "$username" ]; then
        echo "Nombre de usuario no válido."
        return
    fi
    sudo deluser --remove-home $username
}

# Función para crear un nuevo grupo
create_group() {
    read -p "Introduce el nombre del nuevo grupo: " groupname
    if [ -z "$groupname" ]; then
        echo "Nombre de grupo no válido."
        return
    fi
    sudo groupadd $groupname
}

# Función para borrar un grupo
remove_group() {
    echo "Grupos:"
    cat /etc/group | cut -d: -f1
    read -p "Introduce el nombre del grupo a eliminar: " groupname
    if [ -z "$groupname" ]; then
        echo "Nombre de grupo no válido."
        return
    fi
    sudo groupdel $groupname
}

# Mostrar el menú
show_menu

# Solicitar la selección del usuario
read -p "Selecciona una opción del menú: " argument

# Bucle principal
while true; do
    case $argument in
        1) add_user ;;
        2) change_password ;;
        3) add_to_group ;;
        4) remove_from_group ;;
        5) remove_user ;;
        6) create_group ;;
        7) remove_group ;;
        8) echo "Saliendo..." ; exit ;;
        *) echo "Opción inválida" ;;
    esac

    # Mostrar el menú y solicitar la selección del usuario
    show_menu
    read -p "Selecciona una opción del menú: " argument
done
