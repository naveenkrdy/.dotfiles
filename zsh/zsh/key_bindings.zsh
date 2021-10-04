# Bind (Ctrl-Z) to toggle between suspend and resume for vim
zle -N fancy_ctrl_z
bindkey '^Z' fancy_ctrl_z
# Bind (Ctrl-O) to copy active line from the command line buffer
zle -N copybuffer
bindkey "^O" copybuffer
# Key override to (ALT-LeftArrow / ALT-RightArrow) for dircycle omz plugin
bindkey "^[b" insert-cycledleft
bindkey "^[f" insert-cycledright
# Key override to (Ctrl-B / Ctrl-N) for dircycle omz plugin
# bindkey "^B" insert-cycledleft
# bindkey "^N" insert-cycledright