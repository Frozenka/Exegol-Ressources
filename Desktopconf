#!/bin/bash

# URL de l'image à télécharger
IMAGE_URL="https://raw.githubusercontent.com/xct/kali-clean/main/.wal"

# Dossier de destination pour l'image
IMAGE_DIR="/root/Downloads"
IMAGE_PATH="$IMAGE_DIR/23.jpg"

# Créer le dossier de destination si nécessaire
mkdir -p "$IMAGE_DIR"

# Télécharger l'image silencieusement
curl -s -o "$IMAGE_PATH" "$IMAGE_URL"

# Chemin vers le fichier de configuration de Terminator pour root
TERMINATOR_CONFIG="/root/.config/terminator/config"

# Créer le fichier de configuration de Terminator s'il n'existe pas
if [ ! -f "$TERMINATOR_CONFIG" ]; then
    mkdir -p "$(dirname "$TERMINATOR_CONFIG")"
    touch "$TERMINATOR_CONFIG"
fi

# Ajouter ou remplacer les paramètres nécessaires dans le fichier de configuration
cat <<EOF > "$TERMINATOR_CONFIG"
[global_config]

[profiles]
  [[default]]
  background_image = $IMAGE_PATH
  background_type = image
  background_darkness = 0.8
EOF

