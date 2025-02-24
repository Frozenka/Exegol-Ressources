#!/bin/bash
#Petit tool pour définir la cible avec TARGET

# Vérifie si l'argument est passé
if [ -z "$1" ]; then
  echo "Vous devez spécifier une cible !"
  exit 1
fi

# Remplacer l'ancienne valeur de TARGET par la nouvelle dans le fichier profile.sh
sudo sed -i "/^export TARGET=/c\export TARGET='$1'" /opt/tools/Exegol-history/profile.sh

# Affiche un message de confirmation
echo "TARGET set to $1"
