antigen_plugin_settings() {
	
	# OMZ Settings
	DISABLE_MAGIC_FUNCTIONS="true"
	CASE_SENSITIVE="true"
	DISABLE_AUTO_TITLE="true"
	HIST_STAMPS="dd.mm.yyyy"
	
}

antigen_download() {
	# Download antigen
	_check_internet || return 1
	curl -L git.io/antigen >${zsh_dir}/antigen.zsh
}

antigen_config_load() {
	
	# Source antigen
	autoload antigen
	source ${zsh_dir}/antigen.zsh
	
	# Load plugin settings before hand
	antigen_plugin_settings
	
	# Use OMZ framework
	antigen use oh-my-zsh
	
	# Load plugins from OMZ
	antigen bundle macos
	antigen bundle copybuffer
	antigen bundle copyfile
	antigen bundle copypath
	antigen bundle transfer
	antigen bundle sprunge
	antigen bundle git-auto-fetch
	antigen bundle extract
	antigen bundle universalarchive
	antigen bundle per-directory-history
	antigen bundle dircycle
	antigen bundle grc
	
	# Load plugins from external repos
	antigen bundle zdharma-continuum/fast-syntax-highlighting
	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle zsh-users/zsh-completions
	antigen bundle hlissner/zsh-autopair
	# antigen bundle unixorn/tumult.plugin.zsh
	# antigen bundle paulirish/git-open
	# antigen bundle Aloxaf/fzf-tab
	
	# Load theme
	# antigen theme geometry-zsh/geometry
	antigen theme jackharrisonsherlock/common
	
	# Tell Antigen that you're done.
	antigen apply
}

# Change default antigen directory
ADOTDIR="$zsh_dir/antigen"

if [[ ! -f ${zsh_dir}/antigen.zsh ]]; then
	echo "Setting up antigen..."
	antigen_download && antigen_config_load
else
	antigen_config_load
fi
