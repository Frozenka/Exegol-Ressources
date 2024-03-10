cat tmux.conf >> ~/.exegol/my-resources/setup/tmux/tmux.conf
cat aliases >>  ~/.exegol/my-resources/setup/zsh/aliases
cat load_user_setup.sh >>  ~/.exegol/my-resources/setup/load_user_setup.sh
cat history >> ~/.exegol/my-resources/setup/zsh/history

echo "Veuillez entrer votre clé API WPSCAN :"
read api_key
echo wpscan --api-token $api_key --url "http://$TARGET/" --no-banner --plugins-detection aggressive >> ~/.exegol/my-resources/setup/zsh/history
mv ./win $HOME/.exegol/exegol-resources/windows
mv ./Linux $HOME/.exegol/exegol-resources/linux
rm -rf *
