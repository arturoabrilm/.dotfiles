path_prepend() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1${PATH:+:$PATH}" ;;
    esac
    export PATH
}

path_append() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="${PATH:+$PATH:}$1" ;;
    esac
    export PATH
}

ssh_fzf() {
    local ssh_config host
    ssh_config="$HOME/.ssh/config"
    if [ ! -f "$ssh_config" ]; then
        printf 'SSH config file not found at %s.\n' "$ssh_config" >&2
        return 1
    fi
    host="$(
        awk '/^Host / {for (i=2; i<=NF; i++) if ($i != "*") print $i}' "$ssh_config" |
            fzf --prompt='Select SSH host: '
    )"
    [ -n "$host" ] && ssh "$host"
}

loadenv() {
  local env_file="${1:-.env}"
  if [ -f "$env_file" ]; then
    set -a
    source "$env_file"
    set +a
    echo "Successfully loaded $env_file"
  else
    echo "Error: $env_file not found."
    return 1
  fi
}
