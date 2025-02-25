#! /bin/bash


cursor --list-extensions | jq -R '[inputs] | {"recommendations": .}' > home/dot_vscode/extensions/extensions.json

