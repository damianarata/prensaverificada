#!/bin/bash

# Crear un directorio para guardar las imágenes si no existe
IMAGES_DIR="PrensaVerificada2/Assets/img2"

# Definir el número de imágenes a descargar
NUM_IMAGENES=20

# Descargar las imágenes
for ((i=1; i<=NUM_IMAGENES; i++)); do
  echo "Descargando imagen $i..."

  # URL para obtener una imagen aleatoria de 1920x1080 píxeles
  image_url="https://picsum.photos/1920/1080"

  # Descargar la imagen y guardarla en el directorio
  curl -L -s -o "$IMAGES_DIR/imagen_$i.jpg" "$image_url"
  echo "Imagen $i guardada como imagen_$i.jpg"
done

echo "Descarga completada. Las imágenes están en el directorio '$IMAGES_DIR'."
