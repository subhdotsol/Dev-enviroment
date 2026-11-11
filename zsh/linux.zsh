# Linux only.

# tmux prints "_" instead of icons unless the locale name contains UTF-8.
export LANG="${LANG:-en_US.UTF-8}"
case "$LANG" in *UTF-8*|*utf8*) ;; *) export LANG=en_US.UTF-8 ;; esac

# Debian/Ubuntu package fd as fdfind and bat as batcat.
command -v fd  >/dev/null || { command -v fdfind >/dev/null && alias fd=fdfind; }
command -v bat >/dev/null || { command -v batcat >/dev/null && alias bat=batcat; }

path_prepend "$HOME/.cargo/bin"
