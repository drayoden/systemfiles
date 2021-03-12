# some changes to .bashrc

# command prompt color change...
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\][\D{%g.%m.%d|%I:%M%p|%a}]\[\033[01;31m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# some logic to disable the fancy prompt when using vscode...

# don't use the fancy prompt when useing vscode.
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
  source ~/.fancyprompt.sh
fi


