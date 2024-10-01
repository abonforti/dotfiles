#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type password-manager-binary >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    /opt/homebrew/bin/brew install bitwarden-cli
    ;;
Linux)
    curl -L https://github.com/bitwarden/clients/releases/download/cli-v2024.9.0/bw-linux-2024.9.0.zip -o bw.zip && unzip bw.zip -d bw && sudo mv bw/bw /usr/local/bin/bw && sudo chmod +x /usr/local/bin/bw && rm -rf bw.zip bw && bw config server https://bw.alessiobonforti.com && bw login
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac

