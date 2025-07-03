# ll alias...
alias ll='ls -alF --group-directories-first --color=auto'

# curl the weather to the command line alias:
alias wtr='curl wttr.in'

# archlinux update commands:
alias update='sudo pacman -Syu; yay -Syua'; paccache -rk1

# ESP32 stuff;
alias getidf='. $HOME/data/esp/esp-idf/export.sh'

# Fix for UID 1000 wait on reboot/shutdown. may not be needed any more (04/23/24)
alias killterms='killall -9 bash'

# used for KDE update number automation in toolbar. Returns number of updates available.
alias udn='checkupdates | wc -l'

# cli remove all node_modules folders
alias npkill='npx npkill'
