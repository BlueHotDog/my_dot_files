if status is-interactive
end

set -gx EDITOR cursor --wait

fish_add_path /opt/homebrew/sbin

mise activate fish | source

starship init fish | source