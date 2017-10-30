function russp_theme_get_hosticon() {
    if [[ -f $HOME/.hostmoji ]]; then
        cat $HOME/.hostmoji
        return
    elif [[ -d /Users/ ]]; then
        echo ☕
        return
    fi;

    echo 🍕
}

PROMPT='%{$fg_bold[white]%}$(russp_theme_get_hosticon) %{$fg_bold[yellow]%}%t %{$fg_bold[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
RPROMPT="[%{$fg[green]%}${HOST_ALIAS}%{$reset_color%}]"

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

REPO_PROMPT_PREFIX=" %{$reset_color%}(%{$fg[green]%}"
REPO_PROMPT_SUFFIX="%{$reset_color%}) "
