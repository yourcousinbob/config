# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "esc/conda-zsh-completion"
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-history-substring-search"

# Update rate
xset r rate 150 50

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
HISTFILE=~/.zsh_history

# some useful options (man zshoptions)
setopt appendhistory
setopt interactive_comments
unsetopt BEEP
setopt autocd extendedglob nomatch menucomplete
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# completions
zstyle ':completion:*' menu select zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases" 
zsh_add_file "zsh-prompt"

autoload -Uz compinit
compinit
