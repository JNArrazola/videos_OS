#!/bin/bash

# Variable global para el nombre del archivo
FILE_NAME="input_text.txt"

# Función para pedir al usuario que ingrese texto y guardarlo en un archivo
write_to_file() {
    local input
    echo "Por favor, ingresa el texto que deseas guardar en el archivo:"
    read input
    echo "$input" > "$FILE_NAME"
    echo "Texto guardado en el archivo: $FILE_NAME"
}

# Función para leer y mostrar el contenido del archivo
read_file() {
    if [ -f "$FILE_NAME" ]; then
        local content=$(cat "$FILE_NAME")
        echo "Contenido del archivo $FILE_NAME:"
        echo "$content"
    else
        echo "El archivo $FILE_NAME no existe."
    fi
}

# Llamar a las funciones
write_to_file
read_file
