# Load omz library
antigen use oh-my-zsh
# Load bundles from the default OMZ repo
antigen bundle git
antigen bundle pip
antigen bundle colored-man-pages
antigen bundle extract
antigen bundle autojump
# Load bundles from external repos.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma/fast-syntax-highlighting
# Select theme.
antigen theme denysdovhan/spaceship-prompt
# Tell Antigen that you're done.
antigen apply
