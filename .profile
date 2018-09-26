export PS1="\w > \[$(tput sgr0)\]"
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls="ls -lG"
alias ssh="TERM=xterm-256color ssh"
alias ip="curl -s icanhazip.com"
alias paths="echo -e ${PATH//:/\\n}"
alias fza="!git ls-files -m -o --exclude-standard | fzf --print0 -m | xargs -0 -t -o git add"

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


# https://gist.github.com/TheAmazingPT/49ea914a51fc0173e635b10579b48edd
function openpr {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    REPO=`git remote -v | grep fetch | awk '{print $2}'`
    LINK=`echo $REPO | sed 's!git@!https://!' | sed 's!com:!com/!' | head -n1 | sed 's!\b\.git\b!!'`
    
    # For Linux users: change `open` to `xdg-open`
    open $LINK/compare/$BRANCH?expand=1
}

