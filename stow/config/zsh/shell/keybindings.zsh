bindkey -v   # vi mode (equivalent of `set -o vi`)

bindkey -M viins '^L' clear-screen
bindkey -M vicmd '^L' clear-screen

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

bindkey -M viins '^U' backward-kill-line
bindkey -M vicmd '^U' backward-kill-line
bindkey -M viins '^K' kill-line
bindkey -M vicmd '^K' kill-line

# insert-last-word is zsh's equivalent of readline's yank-last-arg
bindkey -M viins '\e.' insert-last-word
bindkey -M vicmd '\e.' insert-last-word

# zsh-autosuggestions: accept the suggestion word by word with Right arrow
# (forward-word is a partial-accept widget; End / Ctrl-E still accept it all)
bindkey -M viins '^[[C' forward-word
bindkey -M viins '^[OC' forward-word

bindkey -s -M viins '^P' 'ssh_fzf\n'
bindkey -s -M vicmd '^P' 'ssh_fzf\n'
bindkey -s -M viins '^O' '^U^Klfcd\n'
bindkey -s -M vicmd '^O' '^U^Klfcd\n'
