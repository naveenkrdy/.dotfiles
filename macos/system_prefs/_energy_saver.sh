sysctl -n machdep.cpu.brand_string | grep AMD >/dev/null 2>&1
if [[ $? == 0 ]]; then
    # Set Display sleep to 15m
    sudo pmset -a displaysleep 15
    # Set Computer sleep to never
    sudo pmset -a sleep 0
    # Set Harddisk sleep to Never
    sudo pmset -a disksleep 0
    # Disable wake on network access
    sudo pmset -a womp 0
    # Disable hibernation
    sudo pmset -a hibernatemode 0
    # Disable proximitywake (icloud wake)
    sudo pmset -a proximitywake 0
    # Disable startup automatically after power failure
    sudo pmset -a autorestart 0
    # Disable power nap
    sudo pmset -a powernap 0
else
    # sudo pmset -a standbydelaylow 10800
    # sudo pmset -a standby 1
    # sudo pmset -a halfdim 1
    sudo pmset -a proximitywake 0
    sudo pmset -a powernap 0
    sudo pmset -a disksleep 10
    # sudo pmset -a standbydelayhigh 86400
    sudo pmset -a sleep 15
    sudo pmset -a hibernatemode 0
    sudo pmset -a displaysleep 15
    # sudo pmset -a tcpkeepalive 1
    # sudo pmset -a highstandbythreshold 50
    # sudo pmset -a acwake 0
    # sudo pmset -a lidwake 1
fi
