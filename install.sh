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
