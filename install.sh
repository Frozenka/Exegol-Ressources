cat tmux.conf > ~/.exegol/my-resources/setup/tmux/tmux.conf
cat aliases >  ~/.exegol/my-resources/setup/zsh/aliases
cat load_user_setup.sh >  ~/.exegol/my-resources/setup/load_user_setup.sh
cat history > ~/.exegol/my-resources/setup/zsh/history

echo wpscan --api-token $api_key --url "http://$TARGET/" --no-banner --plugins-detection aggressive >> ~/.exegol/my-resources/setup/zsh/history
mv ./win/* $HOME/.exegol/exegol-resources/windows
mv ./Linux* $HOME/.exegol/exegol-resources/linux

cd ..
rm -rf Exegol-Ressources
