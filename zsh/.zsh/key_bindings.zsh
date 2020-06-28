# Allow Ctrl-Z to toggle between suspend and resume
zle -N Resume
bindkey "^Z" Resume
