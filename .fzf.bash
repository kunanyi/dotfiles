# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jason/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jason/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jason/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/jason/.fzf/shell/key-bindings.bash"

