# some more ls aliases
alias ll='ls -alF --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias sudoapt='sudo apt update && sudo apt list --upgradable'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
