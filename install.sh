git clone https://github.com/Frozenka/Exegol-Ressources.git
cd Exegol-Ressources

cat tmux.conf >> ~/.tmux.conf
cat aliases >>  /opt/.exegol_aliases
cat history >> ~/.zsh_history

cp /opt/seclists/Passwords/xato-net-10-million-passwords-1000000.txt /opt/bigwl.txt

mv ./win/* /opt/resources/windows
mv ./Linux* "/opt/resources/linux"
mv ./setup.sh /opt

cd ..
rm -rf Exegol-Ressources
cd /tmp
python3 -m pip install --user uploadserver

pip3 install wsgidav
pip install cheroot
pip3 install pyftpdlib

apt-get install snmp-mibs-downloader

wget https://raw.githubusercontent.com/insidetrust/statistically-likely-usernames/master/jsmith.txt -P /opt
echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
#echo  "export TERM=xterm-256color" >> ~/.zshrc
echo "deb http://ftp.fr.debian.org/debian/ jessie main non-free" >> /etc/apt/sources.list
echo "deb-src http://ftp.fr.debian.org/debian/ jessie main non-free" >> /etc/


git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/Frozenka/uploader /opt/tools/uploader

mv Ghostpack-CompiledBinaries /opt/resources/windows
cd /opt/resources/windows wget https://raw.githubusercontent.com/fashionproof/EnableAllTokenPrivs/master/EnableAllTokenPrivs.ps1
cd /opt/resources/windows wget https://raw.githubusercontent.com/Frozenka/linfast/main/winfast
cd /opt/resources/linux https://raw.githubusercontent.com/Frozenka/linfast/main/linfast

#Modification visuel uniquement :
sed -i 's/"#"/"%{$fg[green]%}➜ %{$reset_color%}"/g' /opt/.exegol_shells_rc
sed -i 's/"%m"/"${HOSTNAME#exegol-}"/g' /opt/.exegol_shells_rc
sed -i 's/(%Z)//g' /opt/.exegol_shells_rc


${HOSTNAME#exegol-}


pip3 install -r /opt/tools/uploader/requirements.txt
rm /workspace/install.sh
 
