#!/bin/bash

# Parametros

# Recibe el nombre de un proceso y el comando para ejecutarlo
process_name=$1
command=$2

# Funciones

# Verifica si el proceso esta en ejecucion
verificar_ejecucion() {

    # Variables locales
    # Status que se obtiene a partir del argumento, que es un ID de proceso
    local status="$(ps -p $id -o stat=)"

    # Funcionalidad
    if [ "$status" == "Sl" ]; then
        echo "El archivo esta en ejecucion."
    else
        echo "El archivo no esta en ejecucion."
        eval "$process_name &"
    fi
}

# Programa

# Obtener el ID del proceso
id=$(pgrep $process_name)

# Llamar a funcion verificar_ejecucion
while true; do
    verificar_ejecucion $id
    sleep 5 # La recursion se ejecuta cada 5 segundos
done