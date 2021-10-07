antigen_plugin_settings() {
	# OMZ Settings
	DISABLE_AUTO_TITLE="true"
	HIST_STAMPS="dd.mm.yyyy"
	# Spaceship theme settings
	SPACESHIP_PROMPT_ORDER=(
		# host # Hostname section
		# hg        # Mercurial section (hg_branch  + hg_status)
		# package   # Package version
		# gradle    # Gradle section
		# maven     # Maven section
		# node      # Node.js section
		# ruby      # Ruby section
		# elm       # Elm json section
		# elixir    # Elixir section
		# xcode # Xcode section
		# swift # Swift section
		# golang    # Go section
		# php       # PHP section
		# rust      # Rust section
		# haskell   # Haskell Stack section
		# julia     # Julia section
		# docker # Docker section
		# aws       # Amazon Web Services section
		# gcloud    # Google Cloud Platform section
		# venv      # virtualenv section
		# conda     # conda virtualenv section
		# pyenv     # Pyenv section
		# dotnet    # .NET section
		# ember     # Ember.js section
		# kubectl   # Kubectl context section
		# terraform # Terraform workspace section
		# line_sep  # Line break
		# vi_mode   # Vi-mode indicator
		# user      # Username section
		char # Prompt character
	)
	SPACESHIP_RPROMPT_ORDER=(
		exit_code # Exit code section
		exec_time # Execution time
		jobs      # Background jobs indicator
		dir       # Current directory section
		git       # Git section (git_branch + git_status)
		# battery   # Battery level and status
		# time      # Time stamps section
	)
	# SPACESHIP_PROMPT_ADD_NEWLINE="false"
	SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
	SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
	SPACESHIP_CHAR_SUFFIX=" "
	SPACESHIP_CHAR_SYMBOL=" \uf296 "
	SPACESHIP_DIR_LOCK_SYMBOL=" \uf023 "
	SPACESHIP_DIR_PREFIX="\uf01c "
	SPACESHIP_EXIT_CODE_SHOW="true"
	# SPACESHIP_EXEC_TIME_PREFIX=""
	SPACESHIP_EXEC_TIME_PREFIX="\ufa1a"
}

antigen_download() {
	# Download antigen
	_check_internet || return 1
	curl -L git.io/antigen >${zsh_dir}/antigen.zsh
}
antigen_load() {
	# Source antigen
	autoload antigen
	source ${zsh_dir}/antigen.zsh
	# Load plugin settings
	antigen_plugin_settings
	# Use OMZ framework
	antigen use oh-my-zsh
	# Load plugins from OMZ
	antigen bundle extract
	antigen bundle universalarchive
	antigen bundle per-directory-history
	antigen bundle dircycle
	# Load plugins from external repos
	antigen bundle zdharma/fast-syntax-highlighting
	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle zsh-users/zsh-completions
	antigen bundle hlissner/zsh-autopair
	# Load theme
	# antigen theme geometry-zsh/geometry
	antigen theme jackharrisonsherlock/common
	antigen theme spaceship-prompt/spaceship-prompt
	# antigen theme romkatv/powerlevel10k
	# Tell Antigen that you're done.
	antigen apply
}

# Change default antigen directory
ADOTDIR="$zsh_dir/antigen"

if [[ ! -f ${zsh_dir}/antigen.zsh ]]; then
	echo "Setting up antigen..."
	antigen_download && antigen_load
else
	antigen_load
fi
