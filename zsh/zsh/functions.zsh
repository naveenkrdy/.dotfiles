fancy_ctrl_z() {
  if [[ $#BUFFER -eq 0 ]]; then
    local BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}

# transfer_sh() {
#   [[ $# == 0 ]] && echo "Usage: transfer <file|directory>" && return 1
#   local file="$1"
#   local file_name=$(basename "$file")
#   local link=""
#   if [[ -d $1 ]]; then
#     link=$( (cd "$file" && zip -r -q - .) | curl --progress-bar --upload-file "-" "https://transfer.sh/${file_name}.zip")
#   elif [[ -e $1 ]]; then
#     link=$(cat "$file" | curl --progress-bar --upload-file "-" "https://transfer.sh/${file_name}")
#   fi
#   echo -n "$link" | pbcopy
#   echo "$link"
# }

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

get_bundleid() {
  osascript -e 'on run args
	set output to {}
	repeat with a in args
	set end of output to id of app a
	end
	set text item delimiters to linefeed
	output as text
	end' $1
}

encrypt_256() {
  openssl enc -aes-256-cbc -in "$1" -out "$2"
}

decrpt_256() {
  openssl enc -aes-256-cbc -d -in "$1" -out "$2"
}

convert() {
  case "$1" in
    texttobase) print -n "$2" | base64;;
    basetotext) print -n "$2" | base64 -d && echo;;
    texttohex) print -n "0x$(printf '%s' "$2" | xxd -p)" && echo;;
    hextotext) print -n "${2#0x}" | xxd -r -p && echo;;
    texttobin) print -n "$2" | perl -lape '$_=unpack"B*"' ;;
    bintotext) print -n "$2" | perl -lape '$_=pack"B*",$_';;
    hextobase) print -n "0x$(printf '%s' "${2#0x}" | xxd -r -p | base64)" && echo;;
    basetohex) print -n "0x$(printf '%s' "$2" | base64 -d | xxd -p)" && echo;;
    *) print "Invalid conversion type. Available options: basetohex, hextobase, texttobase, basetotext, texttobin, bintotext, hextotext, texttohex" ;;
  esac
}






kext_perm_fix() {
  sudo chown -R 0:0 "$1"
  sudo chmod -R 0755 "$1"
}
