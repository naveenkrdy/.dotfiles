zsh_dir="${HOME}/.zsh"
function _setup_antigen() {
    _check_internet
	curl -L git.io/antigen >${zsh_dir}/antigen.zsh
}

[[ -f ${zsh_dir}/antigen.zsh ]] && source ${zsh_dir}/antigen.zsh || _setup_antigen && source ${zsh_dir}/antigen.zsh

[[ -f ${zsh_dir}/plugins_settings.zsh ]] && source ${zsh_dir}/plugins_settings.zsh

# Load omz library
antigen use oh-my-zsh
# Load bundles from the default OMZ repo
antigen bundle extract
antigen bundle universalarchive
antigen bundle per-directory-history
antigen bundle dircycle
# Load bundles from external repos.
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle hlissner/zsh-autopair
# Select theme.
#antigen theme geometry-zsh/geometry
antigen theme spaceship-prompt/spaceship-prompt
# Tell Antigen that you're done.
antigen apply
