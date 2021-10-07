print_divider() {
  local div="\u2500"
  local dividecolor="\e[38;05;234m"
  local spacing=""
  ((termwidth = $COLUMNS - 1))
  for i in {1..$termwidth}; do
    local spacing="${spacing}${div}"
  done
  echo
  echo ${dividecolor}${spacing}%F{reset}
}
fancy_ctrl_z() {
  if [[ $#BUFFER -eq 0 ]]; then
    local BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zsh_reload() {
	local cache="$ZSH_CACHE_DIR"
	autoload -U compinit zrecompile
	compinit -i -d "$cache/zcomp-$HOST"

	for f in ${ZDOTDIR:-~}/.zshrc "$cache/zcomp-$HOST"; do
		zrecompile -p $f && command rm -f $f.zwc.old
	done
	# Use $SHELL if it's available and a zsh shell
	local shell="$ZSH_ARGZERO"
	if [[ "${${SHELL:t}#-}" = zsh ]]; then
		shell="$SHELL"
	fi
	# Remove leading dash if login shell and run accordingly
	if [[ "${shell:0:1}" = "-" ]]; then
		exec -l "${shell#-}"
	else
		exec "$shell"
	fi
}
encrypt_256() {
  openssl enc -aes-256-cbc -in "$1" -out "$2"
}
decrpt_256() {
  openssl enc -aes-256-cbc -d -in "$1" -out "$2"
}
base_hex() {
  echo "$1" | base64 -d | od -t x1 -An | tr -d ' ' | cut -f2- -d 'e'
}
hex_base() {
  echo -n "{0e}$1" | xxd -r -p | base64
}
dec_hex() {
	printf '%x\n' "$1"
}
hex_dec() {
	echo $((0x$1))
}
kext_perm_fix() {
  sudo chown -R 0:0 "$1"
  sudo chmod -R 0755 "$1"
}
xcode_clean() {
  [[ -d ./build ]] && rm -rf ./build
  rm -rf ${HOME}/Library/Developer/Xcode/DerivedData/*
}
transfer_sh() {
  [[ $# == 0 ]] && echo "Usage: transfer <file|directory>" && return 1
  local file="$1"
  local file_name=$(basename "$file")
  local link=""
  if [[ -d $1 ]]; then
    link=$( (cd "$file" && zip -r -q - .) | curl --progress-bar --upload-file "-" "https://transfer.sh/${file_name}.zip")
  elif [[ -e $1 ]]; then
    link=$(cat "$file" | curl --progress-bar --upload-file "-" "https://transfer.sh/${file_name}")
  fi
  echo -n "$link" | pbcopy
  echo "$link"
}
quick_look() {
  (($# > 0)) && qlmanage -p $* &>/dev/null &
}
man_preview() {
  man -t "$@" | open -f -a Preview
}
copy_buffer() {
  if which clipcopy &>/dev/null; then
    printf "%s" "$BUFFER" | clipcopy
  else
    echo "clipcopy function not found. Please make sure you have Oh My Zsh installed correctly."
  fi
}
copy_file() {
  emulate -L zsh
  clipcopy "$1"
}
copy_dir() {
  emulate -L zsh
  print -n $PWD | clipcopy
}
opencore_info() {
	local vendor=$(nvram 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:oem-vendor | awk '{print $2}')
	local model=$(nvram 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:oem-product | cut -f2-)
	local ocversion=$(nvram 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102:opencore-version | awk "{print \$(NF)}")
	cat <<EOF

$vendor $model
$ocversion
EOF
}
decomp_aml() {
    for file in ./*.aml; do
        echo
        echo "---------------------------------------------"
        echo
        echo "Current File : $file"
        iasl -vi -ve ./${file}
    done
}
get_bundleid(){
	osascript -e 'on run args
	set output to {}
	repeat with a in args
	set end of output to id of app a
	end
	set text item delimiters to linefeed
	output as text
	end' $1
}
