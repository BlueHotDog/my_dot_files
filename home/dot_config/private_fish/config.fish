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

    # Set greeting to neofetch
    function fish_greeting
        fastfetch
    end
end

ulimit -S -n 2048
set -Ux EDITOR hx

set -Ux MIX_OS_DEPS_COMPILE_PARTITION_COUNT (math (sysctl -n hw.physicalcpu) / 2)

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

alias claude="/Users/danni/.claude/local/claude"
fish_add_path $HOME/.local/bin
