setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY
setopt autocd
unsetopt BEEP

autoload -U add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'
setopt prompt_subst
PROMPT='%F{green}➜%f '
RPROMPT='%F{8}${vcs_info_msg_0_} %1~ %*%f'

source <(fzf --zsh)

# Load custom shell functions.
source "$CONFIG_DIR/terminal/functions/all.zsh"

alias -- ..='cd ..'
alias -- ...='cd ../..'
alias -- ....='cd ../../..'
alias -- .....='cd ../../../..'
alias -- '~'='cd ~'
alias -- :q=exit
alias -- :qa="osascript -e 'quit app \"Wezterm\"'"
alias -- g=git
alias -- ga='git add'
alias -- gaa='git add --all'
alias -- gacp='git add --all && echo '\''Commit Message:'\'' && read message && git commit -m "$message" && git push'
alias -- gc='git commit'
alias -- gcb='git checkout -b'
alias -- gcm='git checkout "$(gmb)"'
alias -- gco='git checkout'
alias -- gcp='git -C "$PROJ_DIR" clone'
alias -- gdp='git stash -u && git stash drop'
alias -- gl='git pull'
alias -- glg='git log'
alias -- gmb='git main-branch'
alias -- gnuke='git clean -xdfi'
alias -- gp='git push'
alias -- gpf='git push --force'
alias -- grm='git fetch && git rebase -i origin/$(gmb)'
alias -- gs='git status'
alias -- gss='git status -s -b'
alias -- lofi='open "https://www.youtube.com/watch?v=E2vONfzoyRI"'
alias -- ls='ls -G'
alias -- vim=nvim
alias -- viml='nvim -c "'\''0"'
alias -- switch='$SYS_CONFIG_DIR/install.sh'
alias -- sourcez='source "$ZDOTDIR/.zshrc"'


# handle key bindings
bindkey -e
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  zle-line-init()   { echoti smkx }
  zle-line-finish() { echoti rmkx }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey "${terminfo[kcuu1]}" up-line-or-history      # Up
bindkey "${terminfo[kcud1]}" down-line-or-history    # Down
bindkey "${terminfo[kcub1]}" backward-char           # Left
bindkey "${terminfo[kcuf1]}" forward-char            # Right
bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history
bindkey '^[[D' backward-char
bindkey '^[[C' forward-char

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}"  end-of-line
bindkey "${terminfo[kdch1]}" delete-char
bindkey '^?' backward-delete-char
