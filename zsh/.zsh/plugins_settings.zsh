# OMZ Settings
DISABLE_AUTO_TITLE="true"
HIST_STAMPS="yyyy-mm-dd"

# OMZ Spaceship settings
SPACESHIP_PROMPT_ORDER=(
  user      # Username section
  dir       # Current directory section
  host      # Hostname section
  git       # Git section (git_branch + git_status)
  hg        # Mercurial section (hg_branch  + hg_status)
  package   # Package version
  node      # Node.js section
  ruby      # Ruby section
  elixir    # Elixir section
  xcode     # Xcode section
  swift     # Swift section
  golang    # Go section
  php       # PHP section
  rust      # Rust section
  haskell   # Haskell Stack section
  julia     # Julia section
  docker    # Docker section
  aws       # Amazon Web Services section
  venv      # virtualenv section
  conda     # conda virtualenv section
  pyenv     # Pyenv section
  dotnet    # .NET section
  ember     # Ember.js section
  kubectl   # Kubectl context section
  terraform # Terraform workspace section
  exec_time # Execution time
  line_sep  # Line break
  vi_mode   # Vi-mode indicator
  jobs      # Background jobs indicator
  char      # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  battery   # Battery level and status
  exit_code # Exit code section
  time      # Time stamps section
)
SPACESHIP_TIME_SHOW="true"
SPACESHIP_TIME_PREFIX=""
SPACESHIP_TIME_SUFFIX=""
SPACESHIP_EXIT_CODE_SHOW="true"
SPACESHIP_CHAR_SYMBOL=" \uf0e7"
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_USER_SHOW="true"
SPACESHIP_DIR_PREFIX=" \uf52d  "
SPACESHIP_DIR_TRUNC="0"
SPACESHIP_DIR_LOCK_SYMBOL=" \uf023 "
SPACESHIP_BATTERY_SHOW="charged"