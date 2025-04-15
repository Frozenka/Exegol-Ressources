# Cloner le dépôt Exegol-Ressources et entrer dans le dossier
apt update
git clone https://github.com/Frozenka/Exegol-Ressources.git
cd Exegol-Ressources

# Ajouter des configurations à tmux.conf et zsh_history
cat tmux.conf >> ~/.tmux.conf
cat aliases >> /opt/.exegol_aliases
cat history >> ~/.zsh_history

# Copier un fichier de mots de passe
cp /opt/seclists/Passwords/xato-net-10-million-passwords-1000000.txt /opt/bigwl.txt

# Télécharger un fichier de liste de chemins
wget https://raw.githubusercontent.com/laluka/pypotomux/main/wordlists/path.lst
curl -sSL https://raw.githubusercontent.com/Frozenka/GetInfoAD/main/setup.sh | sudo bash
cp /usr/share/wordlists/rockyou.txt /opt/

# Déplacer des fichiers et répertoires dans les bons emplacements
mv ./scan.py /opt/resources/scan.py
mv ./scrapmap.py /opt/resources/scrapmap.py
mv ./win/* /opt/resources/windows
mv ./Linux/* /opt/resources/linux
mv ./setup.sh /opt
mv ./path.lst /opt
mv ./.nxc/nxc.conf ~/.nxc.nxc.conf

# Revenir à la racine et supprimer le dossier cloné
cd ..
rm -rf Exegol-Ressources

# Installation de paquets Python et systèmes
cd /tmp
python3 -m pip install --user uploadserver
apt install ripgrep
apt install medusa -y
pip3 install wsgidav cheroot pyftpdlib

# Installation d'outils supplémentaires
apt-get install snmp-mibs-downloader ripgrep
apt install glow
# Modifier la configuration SSH pour autoriser l'authentification par mot de passe
echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# Ajouter des dépôts Debian Jessie
echo "deb http://ftp.fr.debian.org/debian/ jessie main non-free" >> /etc/apt/sources.list
echo "deb-src http://ftp.fr.debian.org/debian/ jessie main non-free" >> /etc/apt/sources.list

# Cloner des dépôts supplémentaires
#git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/vortexau/dnsvalidator.git /opt/tools/dnsvalidator 
git clone https://github.com/Frozenka/PentestRecon.git /opt/tools/PentestRecon

# Déplacer les fichiers clonés dans les emplacements corrects
#mv Ghostpack-CompiledBinaries /opt/resources/windows

# Télécharger des scripts spécifiques dans les bons répertoires
cd /opt/resources/windows
wget https://raw.githubusercontent.com/fashionproof/EnableAllTokenPrivs/master/EnableAllTokenPrivs.ps1
wget https://raw.githubusercontent.com/Frozenka/linfast/main/winfast
wget https://raw.githubusercontent.com/Frozenka/Exegol-Ressources/refs/heads/main/getdns.sh -O /opt/tools/dnsvalidator/getdns.sh

cd /opt/resources/linux
wget https://raw.githubusercontent.com/Frozenka/linfast/main/linfast


cd /opt/tools/dnsvalidator
pip3 install -r requirements.txt
python3 setup.py install

# Modifications visuelles
sed -i 's/^exh /exegol /g' /opt/.exegol_history /opt/.exegol_aliases 
sed -i 's/"#"/"%{$fg[green]%}➜ %{$reset_color%}"/g' /opt/.exegol_shells_rc
sed -i 's/"%m"/"${HOSTNAME#exegol-}"/g' /opt/.exegol_shells_rc
sed -i 's/(%Z)//g' ~/.zshrc

chmod +x /opt/tools/Exegol-history/settarget.sh
# Supprimer le script d'installation
rm /workspace/install.sh
