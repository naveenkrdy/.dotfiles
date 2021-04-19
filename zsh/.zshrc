setopt rmstarsilent

zsh_dir="${HOME}/.zsh"
vim_dir="${HOME}/.vim"
antigen_dir="${HOME}/.antigen"
plugged_dir="${vim_dir}/plugged"
brew_zsh="/usr/local/bin/zsh"

#Checks
# [[ $TERM != "screen" ]] && exec tmux
[[ ! -f ${HOME}/.hushlogin ]] && touch ${HOME}/.hushlogin
[[ (-x $brew_zsh) && (${SHELL} != ${brew_zsh}) ]] && echo ${brew_zsh} | sudo tee -a /private/etc/shells && chsh -s ${brew_zsh}
[[ ! -f "${zsh_dir}/antigen.zsh" ]] && curl -L git.io/antigen >${zsh_dir}/antigen.zsh && source ${zsh_dir}/antigen.zsh || source ${zsh_dir}/antigen.zsh
[[ -d ${plugged_dir}/gruvbox ]] && source ${plugged_dir}/gruvbox/gruvbox_256palette.sh

#Exports
[[ -f ${zsh_dir}/exports.zsh ]] && source ${zsh_dir}/exports.zsh

#Plugins Settings
[[ -f ${zsh_dir}/plugins_settings.zsh ]] && source ${zsh_dir}/plugins_settings.zsh

#Plugins
[[ -f ${zsh_dir}/plugins.zsh ]] && source ${zsh_dir}/plugins.zsh

#Aliases
[[ -f ${zsh_dir}/aliases.zsh ]] && source ${zsh_dir}/aliases.zsh

#Functions
[[ -f ${zsh_dir}/functions.zsh ]] && source ${zsh_dir}/functions.zsh

#Key-bindings
[[ -f ${zsh_dir}/key_bindings.zsh ]] && source ${zsh_dir}/key_bindings.zsh

