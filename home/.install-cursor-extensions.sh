#!/opt/homebrew/bin/fish

set list (cat ~/.cursor/extensions/extensions.json | jq -r '.[].identifier.id')
set actual_list (cursor --list-extensions)
for extension in $list
    if not contains "$extension" $actual_list
        echo "Installing extension: $extension"
        cursor --install-extension $extension &
    end
end
wait
