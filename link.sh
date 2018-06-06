#!/bin/bash
dotfiles=(".vimrc" ".profile" ".gitconfig" ".fzf.bash" ".inputrc" "xterm-256color-italic.terminfo")
dir="${HOME}/dotfiles"
for dotfile in "${dotfiles[@]}";do
 ln -sf "${dir}/${dotfile}" "${HOME}/${dotfile}"
done
