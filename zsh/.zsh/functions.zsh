function encrypt() {
  openssl enc -aes-256-cbc -in ${1} -out ${2}
}
function decrypt() {
  openssl enc -aes-256-cbc -d -in ${1} -out ${2}
}
function basetohex() {
  echo "${1}" | base64 -d | od -t x1 -An | tr -d ' '
}
function hextobase() {
  echo -n "${1}" | xxd -r -p | base64
}
function kextpermfix() {
  sudo chown -R 0:0 ${1}
  sudo chmod -R 0755 ${1}
}
# function hextopatch() {
# 	echo $1
# 	 echo $2
#   hex_find_fix="$(bash -c echo $1 | sed 's/../\\x&/g')"
#   hex_replace_fix="$(bash -c echo $2 | sed 's/../\\x&/g')"
#   echo $hex_find_fix
#   echo $hex_replace_fix
#   [[ ${#} == 3 ]] && sudo perl -i -pe "s|\$\{hex_find_fix}|\$\{hex_replace_fix\}|sg" ${3} || echo "Usage: hextopatch [find] [replace] [file]"
# }
function Resume() {
  fg
  zle push-input
  BUFFER=""
  zle accept-line
}
