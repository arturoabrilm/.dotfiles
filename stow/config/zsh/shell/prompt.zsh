autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%{%F{3}%} ✗%{%f%}'
zstyle ':vcs_info:*' stagedstr   '%{%F{2}%} ✓%{%f%}'

zstyle ':vcs_info:git:*' formats       ' %{%F{8}%}on%{%f%} %{%F{2}%}󰊢 %b%{%f%}%c%u'
zstyle ':vcs_info:git:*' actionformats ' %{%F{8}%}on%{%f%} %{%F{2}%}󰊢 %b%{%f%}%c%u %{%F{3}%}(%a)%{%f%}'

add-zsh-hook precmd vcs_info

# ANSI palette: gray framing, cyan host, yellow path, green Git branch.
PROMPT='%{%F{8}%}╭─%{%f%} %{%F{6}%} %m%{%f%} %{%F{3}%}%~%{%f%}${vcs_info_msg_0_}
%{%F{8}%}╰─%{%f%}%(?.%{%F{3}%}.%{%F{1}%})❯%{%f%} '

# Show the active conda/venv environment instead of the hostname:
# PROMPT='%{%F{8}%}╭─%{%f%} %{%F{6}%}(${CONDA_DEFAULT_ENV:-${VIRTUAL_ENV_PROMPT:-base}})%{%f%} %{%F{3}%}%~%{%f%}${vcs_info_msg_0_}
# %{%F{8}%}╰─%{%f%}%(?.%{%F{3}%}.%{%F{1}%})❯%{%f%} '
