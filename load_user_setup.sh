git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
python3 -m pip install --user uploadserver
pip3 install wsgidav
echo  "export TERM=xterm-256color" >> ~/.zshrc
pip install cheroot
pip3 install pyftpdlib
wget https://raw.githubusercontent.com/insidetrust/statistically-likely-usernames/master/jsmith.txt -P /opt
echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
