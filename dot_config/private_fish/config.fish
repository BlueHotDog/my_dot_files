if status is-interactive
end

set -gx EDITOR cursor --wait
set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
man 2 select

fish_add_path /opt/homebrew/sbin

mise activate fish | source

starship init fish | source