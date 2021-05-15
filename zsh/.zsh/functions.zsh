function encrypt() {
  openssl enc -aes-256-cbc -in $1 -out $2
}
function decrypt() {
  openssl enc -aes-256-cbc -d -in $1 -out $2
}
function basetohex() {
  echo "${1}" | base64 -d | od -t x1 -An | tr -d ' '
}
function hextobase() {
  echo -n "${1}" | xxd -r -p | base64
}
function kextpermfix() {
  sudo chown -R 0:0 $1
  sudo chmod -R 0755 $1
}
function resume() {
  fg
  zle push-input
  BUFFER=""
  zle accept-line
}
function close_tmux() {
  tmux kill-server
}
function xclean() {
  [[ -d ./build ]] && rm -rf ./build
  rm -rf ${HOME}/Library/Developer/Xcode/DerivedData/*
}
function tf() {
  [[ $# == 0 ]] && echo "Usage: transfer <file|directory>" && return 1
  file="$1"
  file_name=$(basename "$file")
  if [[ -d $1 ]]; then
    link=$( (cd "$file" && zip -r -q - .) | curl --progress-bar --upload-file "-" "https://transfer.sh/${file_name}.zip")
  elif [[ -e $1 ]]; then
    link=$(cat "$file" | curl --progress-bar --upload-file "-" "https://transfer.sh/${file_name}")
  fi
  echo -n "$link" | pbcopy
  echo "$link"
}
