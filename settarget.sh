#!/bin/bash
# Vérifie si l'argument est passé
if [ -z "$1" ]; then
  echo "Vous devez spécifier une cible !"
  exit 1
fi

# Supprimer toutes les lignes existantes contenant 'export TARGET'
sudo sed -i '/^export TARGET=/d' /opt/tools/Exegol-history/profile.sh

# Ajouter la nouvelle ligne export TARGET='$1' dans le fichier profile.sh
echo "export TARGET='$1'" | sudo tee -a /opt/tools/Exegol-history/profile.sh > /dev/null

# Affiche un message de confirmation
echo "TARGET set to $1"

# Appliquer immédiatement la modification dans l'environnement actuel
export TARGET="$1"
