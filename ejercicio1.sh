#!/bin/bash

id=$1

# Nombre del proceso
name=$(ps -p $id -o comm=)
echo "Nombre: $name"

# ID del proceso
echo "ID del proceso: $id"

# Parent process ID
pp_id=$(ps -p $id -o ppid=)
echo "Parent process ID: $pp_id"

# Usuario propietario
user=$(ps -p $id -o user=)
echo "Usuario propietario: $user"

# Porcentaje de uso del CPU
cpu=$(ps -p $id -o %cpu=)
echo "Uso del CPU: $cpu %"

# Consumo de memoria
mem=$(ps -p $id -o %mem=)
echo "Consumo de memoria: $mem %"

# Estado
status=$(ps -p $id -o stat=)
echo "Estado: $status"

# Path del ejecutable
path=$(readlink /proc/$id/exe)
echo "Path del ejecutable: $path"