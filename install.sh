git clone https://github.com/Frozenka/Exegol-Ressources.git
cd Exegol-Ressources

cat tmux.conf >> ~/.tmux.conf
cat aliases >>  /opt/.exegol_aliases
cat history >> ~/.zsh_history

mv ./win/* /opt/resources/windows
mv ./Linux* /optresources/linux
mv ./setup.sh /opt

cd ..
rm -rf Exegol-Ressources
cd /tmp
python3 -m pip install --user uploadserver

pip3 install wsgidav
pip install cheroot
pip3 install pyftpdlib

wget https://raw.githubusercontent.com/insidetrust/statistically-likely-usernames/master/jsmith.txt -P /opt
echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo  "export TERM=xterm-256color" >> ~/.zshrc

git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries.git 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mv Ghostpack-CompiledBinaries /opt/resources/windows
cd /opt/windows wget https://raw.githubusercontent.com/fashionproof/EnableAllTokenPrivs/master/EnableAllTokenPrivs.ps1
cd /opt/windows wget https://raw.githubusercontent.com/Frozenka/linfast/main/winfast
cd /opt/linux https://raw.githubusercontent.com/Frozenka/linfast/main/linfast

rm /workspace/install.sh
echo "configuration perso ok"
