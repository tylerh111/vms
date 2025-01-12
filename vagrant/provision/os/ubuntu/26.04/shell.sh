#!/usr/bin/env bash
set -eoux pipefail

# setup default shell
sudo chsh -s "$(which fish)" "$(whoami)"

# setup shell config
fish -c 'set -Uu fish_greeting ""'
fish -c 'alias -s egrep="egrep --color=auto"'
fish -c 'alias -s fgrep="fgrep --color=auto"'
fish -c 'alias -s grep="grep --color=auto"'
fish -c 'alias -s la="ls -A"'
fish -c 'alias -s l="ll"'
fish -c 'alias -s ll="ls -alhF"'
fish -c 'alias -s ls="ls --color=auto"'

# setup shell them (defered)
# shell configs copied in from vagrant "file" provider
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | fish -c 'source - && fisher install jorgebucaran/fisher'
# fish -c 'fisher install lambda'
# sed -Ei 's|s=\$HOME=⌁=|s=\$HOME=~=|g' ~/.config/fish/functions/fish_prompt.fish
# sed -Ei 's|\$hostcolor|\$white|g' ~/.config/fish/functions/fish_prompt.fish
# awk '/set -l current_user/ { print ; print "read -l vagrant_os < /box/vagrant_os_version_codename" ; next}1' ~/.config/fish/functions/fish_prompt.fish
# awk '/set -l current_user/ { print ; print "read -l vagrant_vm < /box/vagrant_vm" ; next}1' ~/.config/fish/functions/fish_prompt.fish
