# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
#ZSH_THEME="dracula"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	git-prompt
	zsh-autosuggestions
 	zsh-syntax-highlighting
	zsh-vi-mode
)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export VISUAL=vim


# ------------------------------------------
# Aliases
alias up='cd ..'
alias vi='vim'
alias ok='okular'
alias xclip='xlip -selection c'
alias hx='hx -c $HOME/.dotfiles/helix/config.toml'

# Remap ll and la to use exa if it exists.
if type "eza" > /dev/null; then
    export EZA_CONFIG_DIR="/$USER/.dotfiles/eza"
    alias ll='eza -lg --hyperlink --header --icons=always'
    alias lf='eza -lgf --hyperlink --header --icons=always'
    alias ld='eza -lgD --show-symlinks --header --icons=always'
    alias lg='eza -lg --git --git-repos --hyperlink --header --icons=always'
    alias la='eza -lag --hyperlink --header --icons=always'
    alias lag='eza -lahg --git --git-repos --icons=always'
    if type brew &>/dev/null; then
        FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
        autoload -Uz compinit
        compinit
    else
        export FPATH="/home/jefo/eza/completions/zsh:$FPATH"
    fi
elif type "exa" > /dev/null; then
    alias ll='exa -lhg'
    alias la='exa -lahg'
fi

# Set alias for TMUX if it exists.
if type "tmux" > /dev/null; then
    alias tmux='tmux -f $HOME/.dotfiles/tmux/.tmux.conf'
fi

# Set alias for ranger if it exists.
if type "ranger" > /dev/null; then
    alias ranger='ranger --confdir=$HOME/.dotfiles/ranger'
fi
# ------------------------------------------


# If the LS_COLORS was correctly cloned we shall update $LS_COLORS
#if [ -f $HOME/.dotfiles/LS_COLORS/lscolors.sh ]; then
#    source $HOME/.dotfiles/LS_COLORS/lscolors.sh
#fi

# Let's setup bat if it is installed.
if type "bat" > /dev/null; then
    export BAT_THEME="Dracula"
    #export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

    # Use bat as diff viewer
    batdiff() {
        git diff --name-only --relative --diff-filter=d | xargs bat --diff
    }
    
    alias bathelp='bat --plain --language=help'
    help() {
        "$@" --help 2>&1 | bathelp
    }

    alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
    alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
fi

# ------------------------------------------
# Nifty functions
#
# Usy kitty +kitten to ssh
kssh() {
    kitty +kitten ssh $1 
}

# Function to print all colors in terminal.
printcol () {
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}
# ------------------------------------------

# Based on OS we load either OS-specific .zshrc
if [[ $(uname) == "Darwin" ]]; then
    source $HOME/.dotfiles/zsh/.macos.zshrc
elif [[ $(uname) == "Linux" ]]; then
    source $HOME/.dotfiles/zsh/.linux.zshrc
else
    echo 'Unknown OS!'
fi
