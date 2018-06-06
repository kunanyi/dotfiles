export PS1="\w > \[$(tput sgr0)\]"
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls="ls -lG"


# Fuzzy finder
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# https://github.com/magicmonty/bash-git-prompt
export GIT_PROMPT_THEME=Single_line_Solarized
GIT_PROMPT_THEME=Single_line
GIT_PROMPT_ONLY_IN_REPO=1
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi


# https://gist.github.com/pablete/5871811
function tabc() { NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi; echo -e "\033]50;SetProfile=$NAME\a"; }
function colorssh() { tabc SSH; ssh $*; tabc; }
alias ssh="colorssh"


if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
