# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# Make it easy to add your own customizations without having to modify this file too much

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

export XDG_USER_CONFIG_DIR="$HOME/.config/"

# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx --keeptty; fi

export EDITOR="nvim"
# export RUST_SRC_PATH=/usr/local/src/rust/src

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    source ~/.zpreztorc
fi

source ~/.zsh_dot/*

# neofetch

# Use a split pane in tmux
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=40%

[ -s ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enhance ALT-C with better sorting and a tree preview
# http://theinfiniteset.net/content/2016/08/combining-tools-blsd-and-fzf/
command -v blsd > /dev/null && export FZF_ALT_C_COMMAND='blsd'
command -v tree > /dev/null && export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -$LINES'"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add ~/.ssh/id_rsa
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# if [ -z "$TMUX" ]; then
#     tmux attach -t default || tmux new -s default
# fi
