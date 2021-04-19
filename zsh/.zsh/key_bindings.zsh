# Allow Ctrl-Z to toggle between suspend and resume
zle -N resume
bindkey "^Z" resume
