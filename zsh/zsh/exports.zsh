HISTORY_IGNORE="(history|ls|cd)" # History ignore list
HISTFILE="${HOME}/.zsh_history"  # History file location
HISTSIZE=100000                  # Max command lines to stored in memory while your bash session is ongoing
SAVEHIST=$HISTSIZE               # Max History file size

# setopt ALL_EXPORT                 # Start auto-exporting variables
# setopt AUTO_CD                  # 'cd' to a directory without typing cd
# setopt AUTO_MENU                # Auto use menu completion after the second consecutive request for completion
# setopt AUTO_PUSHD               # Auto add path to dir stack when doing 'cd'
# setopt AUTO_LIST                # Auto list choices on an ambiguous completion
# setopt ALWAYS_TO_END            # Allows completion performed with the cursor within a word
# setopt CORRECT                  # Spelling correction for commands
# setopt CORRECT_ALL              # Spelling correction for commands arguments
# setopt COMPLETE_IN_WORD         # Set cursor to the end of the word if completion is started
# setopt EXTENDED_HISTORY         # Add time stamps to history entires
# setopt GLOBDOTS                 # Allow files beginning with '.' be matched without explicitly specifying the dot
# setopt EXTENDED_GLOB            # Treat the '#', '~' and '^' characters as part of patterns for filename generation
# setopt HIST_EXPIRE_DUPS_FIRST   # Delete duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS        # Do not list history entries previously found again upon searching
# setopt HIST_IGNORE_DUPS         # Don't record an entry that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS     # Delete old recorded entry if new entry is a duplicate.
# setopt HIST_IGNORE_SPACE        # Ignore adding commands to history list that starts with spaces
setopt HIST_REDUCE_BLANKS       # Remove blank lines added to history list
setopt HIST_SAVE_NO_DUPS        # Do not add duplicate entries to history list
# setopt INC_APPEND_HISTORY       # Write to history file immediately, not when the shell exits.
# setopt INTERACTIVE_COMMENTS     # Allow inline interactive comments in shell
# setopt LIST_PACKED              # Make completion list smaller using different column widths
setopt MENU_COMPLETE            # Insert the first match immediately on hitting tab for completion list
setopt NO_BEEP               	# Disable shell beep sound
# setopt PROMPT_SUBST             # Allow parameter, arithmetic expansion and command substitution to be performed in prompt
# setopt PUSHD_IGNORE_DUPS        # Dont add duplicates to pushd directory stack
# setopt PUSHD_MINUS              # Exchanges meanings of '+' and '-' when used with a number to specify directory in the stack.
# setopt RM_STAR_SILENT           # Do not query the user before executing 'rm *' or 'rm path/*' etc
# setopt SHARE_HISTORY            # Share history across instances of shell
unsetopt PROMPT_SP              # Do not print '%' character on terminal startup


# Zstyle completion settings
zstyle ':completion:*' verbose yes # Enable verbose
zstyle ':completion:*:descriptions' format $'%B%U%d%u%b'
zstyle ':completion:*:messages' format $'%{\e[38;05;239m%} Message : %d%{\e[m%}'
zstyle ':completion:*:warnings' format $'%{\e[38;05;238m%} No matches in %d%{\e[m%}'
# Sort results by directory first
zstyle ':completion:*' list-dirs-first true
# Group results by category
zstyle ':completion:*' group-name ''
# Display custom scrolling percentage
zstyle ':completion:*' select-prompt $'%{\e[38;05;249m%}%SSelection at %p%s%{\e[m%}'
# Enable approximate matches
# zstyle ':completion:::::' completer _expand _complete _ignored _approximate
# Order of results that match
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[-_.]=* r:|=*' 'm:{a-z}={A-Z} r:|[-_.]=* r:|=*'
# Enable colors
zstyle ':completion:*' list-colors 'ma=1;30;43:ow=1;36:di=0;36:ln=35'
# Enable selection with arrow keys
zstyle ':completion:*' menu select




# Exports
export PATH="/usr/local/sbin:${PATH}"
export PATH="$(brew --prefix ruby)/bin:${PATH}"
export PATH="$(gem environment gemdir)/bin:${PATH}"
export PATH="${HOME}/bin:${PATH}"
export EDITOR='vim'
export LC_ALL='en_US.UTF-8'
export HOMEBREW_NO_ANALYTICS=1
export PYTHONIOENCODING='UTF-8'
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;33m'
export LESS_TERMCAP_so=$'\e[01;44;37m'
export LESS_TERMCAP_us=$'\e[01;37m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export MANPAGER='less -s -M +Gg'