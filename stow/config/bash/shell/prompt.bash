# ANSI palette: gray framing, cyan host, yellow path, green Git branch.
PS1='\[\e[90m\]╭─\[\e[0m\] \[\e[36m\] \h\[\e[0m\] \[\e[33m\]\w\[\e[0m\]$(__git_ps1 " \[\e[90m\]on\[\e[0m\] \[\e[32m\]󰊢 %s\[\e[0m\]")\n\[\e[90m\]╰─\[\e[0;33m\]❯\[\e[0m\] '

# Show the active conda/venv environment instead of the hostname:
# PS1='\[\e[90m\]╭─\[\e[0m\] \[\e[36m\](${CONDA_DEFAULT_ENV:-${VIRTUAL_ENV_PROMPT:-base}})\[\e[0m\] \[\e[33m\]\w\[\e[0m\]$(__git_ps1 " \[\e[90m\]on\[\e[0m\] \[\e[32m\]󰊢 %s\[\e[0m\]")\n\[\e[90m\]╰─\[\e[0;33m\]❯\[\e[0m\] '
