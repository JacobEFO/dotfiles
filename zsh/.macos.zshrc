# We no longer need the following line because zsh-vi-mode is installed under the .oh-my-zsh/custom/plugins
#source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f $HOME/.dotfiles/powerlevel10k/.p10k.macos.zsh ]] || source $HOME/.dotfiles/powerlevel10k/.p10k.macos.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jefo/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jefo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jefo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jefo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Set environment variables
export STM32CubeMX_PATH=/Applications/STMicroelectronics/STM32CubeMX.app/Contents/Resources
export PATH=".:$PATH:/Applications/Sublime Text.app/Contents/MacOS"
export PATH="/Users/jefo/oss-cad-suite/bin:$PATH"
export PATH="/Users/jefo/xschem-macos/bin:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"
export EDITOR=mvim
export VISUAL=mvim

alias skim="Skim"


# Set aliases
alias kicad-cli='/Applications/KiCad/KiCad.app/Contents/MacOS/kicad-cli'
alias subl='sublime_text'
