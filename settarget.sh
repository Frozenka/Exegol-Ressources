#!/bin/bash
# Vérifie si l'argument est passé
if [ -z "$1" ]; then
  echo "Vous devez spécifier une cible !"
  exit 1
fi

# Ajouter la ligne export TARGET='$1' dans le fichier profile.sh
echo "export TARGET='$1'" | sudo tee -a /opt/tools/Exegol-history/profile.sh > /dev/null

# Affiche un message de confirmation
echo "TARGET set to $1"

# Recharger le fichier profile.sh pour appliquer la modification
source /opt/tools/Exegol-history/profile.sh
exec zsh
