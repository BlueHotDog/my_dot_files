if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)

    if type -q mise
        mise activate fish | source
    end

    if type -q thefuck
        thefuck --alias | source
    end

    if type -q starship
        starship init fish | source
    end

    if type -q zoxide
        zoxide init fish | source
    end

    set fish_tmux_autostart true

    # Set greeting to neofetch
    function fish_greeting
        fastfetch
    end
end
set -Ux EDITOR hx
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Created by `pipx` on 2025-03-23 13:09:29
set -gx PATH $PATH /Users/danni/.local/bin
set -gx COMPOSE_X_NO_UI 1
