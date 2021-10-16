# Bind (Ctrl-Z) to toggle between suspend and resume for vim
zle -N fancy_ctrl_z
bindkey '^Z' fancy_ctrl_z
# Key override to (ALT-LeftArrow / ALT-RightArrow) for dircycle omz plugin
bindkey "^[b" insert-cycledleft
bindkey "^[f" insert-cycledright
# (OR) (Ctrl-B / Ctrl-N)
# bindkey "^B" insert-cycledleft
# bindkey "^N" insert-cycledright
