#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type password-manager-binary >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    /opt/homebrew/bin/brew install bitwarden-cli
    ;;
Linux)
    wget -O /tmp/bw.zip https://github.com/bitwarden/clients/releases/download/cli-v2024.9.0/bw-linux-2024.9.0.zip
    unzip /tmp/bw.zip
    mv /tmp/bw /usr/local/bin/bw
    chmod +x /usr/local/bin/bw
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac

