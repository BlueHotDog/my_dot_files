#!/bin/bash
set -ex


case "$(uname -s)" in
Darwin)
    if [ ! -d "/Applications/1Password.app" ]; then
      brew install --cask 1password
    fi
    
    if type op >/dev/null 2>&1; then
        echo "1Password CLI is already installed"
    else
        brew install 1password-cli
    fi
;;
*)
    echo "unsupported OS"
    exit 1
;;
esac

read -p "Please open 1Password, log into all accounts and set under Settings>CLI activate Integrate with 1Password CLI. Press any key to continue." -n 1 -r
echo
