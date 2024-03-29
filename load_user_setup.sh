git clone https://github.com/Frozenka/Exegol-Ressources.git
cd Exegol-Ressources

bash $HOME/.exegol/exegol-resources/setup.sh
cat tmux.conf > ~/.exegol/my-resources/setup/tmux/tmux.conf
cat aliases >  ~/.exegol/my-resources/setup/zsh/aliases
cat history > ~/.exegol/my-resources/setup/zsh/history

cd ..
rm -rf Exegol-Ressources
