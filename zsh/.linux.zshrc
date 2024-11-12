source ~/powerlevel10k/powerlevel10k.zsh-theme

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

[[ ! -f $HOME/.dotfiles/powerlevel10k/.p10k.linux.zsh ]] || source $HOME/.dotfiles/powerlevel10k/.p10k.linux.zsh

# We must add cargo's binaries to the path to be able to execute them!
PATH=$PATH:~/.cargo/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jefo/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jefo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jefo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jefo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PATH="/home/jefo/oss-cad-suite/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Aliases
alias sshlog='journalctl -r /usr/sbin/sshd'
alias xclip='/usr/bin/xclip -selection c'

# Export
export XDG_CONFIG_HOME=$HOME/.dotfiles
