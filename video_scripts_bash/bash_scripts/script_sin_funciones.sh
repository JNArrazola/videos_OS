#!/bin/bash

# *Este script respalda un archivo a un comprimido en formato ZIP

# Directorio a respaldar
DIRECTORIO_ORIGEN="/home/jarrazola/Documents/video_equipo_unidad2/video_scripts_bash"
# Directorio donde se guardará el respaldo
DIRECTORIO_RESPALDO="/home/jarrazola/Documents/video_equipo_unidad2"
# Nombre del archivo de respaldo
NOMBRE_RESPALDO="respaldo_$(date +%Y%m%d%H%M%S).zip"

# Crear el directorio de respaldo si no existe
mkdir -p "$DIRECTORIO_RESPALDO"

# Crear el archivo de respaldo comprimido en formato ZIP
zip -r "$DIRECTORIO_RESPALDO/$NOMBRE_RESPALDO" "$DIRECTORIO_ORIGEN"

# Verificar si la operación fue exitosa
if [ $? -eq 0 ]; then
    echo "Respaldo creado exitosamente: $DIRECTORIO_RESPALDO/$NOMBRE_RESPALDO"
else
    echo "Error al crear el respaldo."
fi
