# Make it easy to add your own customizations without having to modify this file too much

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi


# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="true"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx --keeptty; fi

export EDITOR="vim"
# export RUST_SRC_PATH=/usr/local/src/rust/src
export PATH=$PATH:~/.cabal/bin

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

source ~/.zpreztorc

source ~/.zsh_dot/aliases

# neofetch
