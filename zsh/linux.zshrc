source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f $HOME/.dotfiles/powerlevel10k/.p10k.zsh.linux ]] || source $HOME/.dotfiles/powerlevel10k/.p10k.zsh.linux

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
