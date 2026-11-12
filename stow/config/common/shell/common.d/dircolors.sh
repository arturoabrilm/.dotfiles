# Use the terminal's ANSI palette, shared with Neovim and the shell prompt.
command -v vivid >/dev/null && export LS_COLORS="$(vivid generate terminal)"
