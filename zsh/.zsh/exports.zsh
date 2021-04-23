export PATH="/usr/local/opt/ruby/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"
export PATH="${HOME}/bin:/usr/local/bin:${PATH}"

export ZSHRC="${HOME}/.zshrc"
export VIMRC="${HOME}/.vimrc"
export EDITOR='vim'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export PYTHONIOENCODING='UTF-8'
export TERM='xterm-256color'

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

setopt RM_STAR_SILENT
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP