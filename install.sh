cat tmux.conf > ~/.exegol/my-resources/setup/tmux/tmux.conf
cat aliases >  ~/.exegol/my-resources/setup/zsh/aliases
cat history > ~/.exegol/my-resources/setup/zsh/history

echo wpscan --api-token $api_key --url "http://$TARGET/" --no-banner --plugins-detection aggressive > ~/.exegol/my-resources/setup/zsh/history
mv ./win/* /opt/resources/windows
mv ./Linux* /optresources/linux
mv ./setup.sh /opt
cd ..
rm -rf Exegol-Ressources
