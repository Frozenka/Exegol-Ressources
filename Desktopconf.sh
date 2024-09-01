#!/bin/bash
IMAGE_URL="https://raw.githubusercontent.com/xct/kali-clean/main/.wallpaper/23.jpg"
IMAGE_DIR="/root/Downloads"
IMAGE_PATH="$IMAGE_DIR/23.jpg"
mkdir -p "$IMAGE_DIR"
curl -s -o "$IMAGE_PATH" "$IMAGE_URL"
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

