prompt_russp_main() {
  prompt_bold
  prompt_russp_symbol
  prompt_russp_time
  prompt_russp_directory
  prompt_git
  prompt_end_bold
  #  %{%F{blue}%}$(git_prompt_info)%{%F{blue}%} % %{$reset_color%}"
}

prompt_bold() {
  print -n "$FX[bold]"
}
prompt_end_bold() {
  print -n "$FX[no-bold]"
}

prompt_russp_time() {
  print -n "%F{yellow} %t"
}

prompt_russp_symbol() {
  print -n "%{%F{white}%}♛"
}

prompt_russp_directory() {
  print -n " %{%F{cyan}%}%c"
}



prompt_russp_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  prompt_opts=(cr subst percent)

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'

  PROMPT="$(prompt_russp_main)"

  RPROMPT="$FG[white][$FG[green]${HOST_ALIAS}$FG[white]]$FG[none]"
  CURRENT_BG='NONE'
}

prompt_russp_setup "$@"
