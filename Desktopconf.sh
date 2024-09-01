#!/bin/bash
cd /root/Download
wget https://raw.githubusercontent.com/xct/kali-clean/main/.wallpaper/23.jpg
TERMINATOR_CONFIG="/root/.config/terminator/config"

if [ ! -f "$TERMINATOR_CONFIG" ]; then
    mkdir -p "$(dirname "$TERMINATOR_CONFIG")"
    touch "$TERMINATOR_CONFIG"
fi

cat <<EOF > "$TERMINATOR_CONFIG"
[global_config]
[profiles]
  [[default]]
  background_image = $IMAGE_PATH
  background_type = image
  background_darkness = 0.8
EOF

