# systemfiles
personal configs for my environment


* python3 - ubuntu now only includes python3. Typing "python" does nothing. Include this at the end of .bashrc to allow 'python' or 'python3' to be used:
  * `python() { python3 "$@"; |`
    `export -f python`
