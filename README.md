# Dotfiles

## Install
```
git clone git@github.com:JacobEFO/dotfiles.git ~/.dotfiles
```

## ZSH 
To use the ZSH settings add the following to your `~/.zshrc`.
```
source $HOME/.dotfiles/zsh/.zshrc
```

This will load the OS shared settings in `.dotfiles/zsh/.zshrc` and the
corresponding settings for Linux and MaOS respectively.

## TMUX
To use the `tmux` config file set the following alias:
```
alias='tmux -f $HOME/.dotfiles/tmux/.tmux.conf'
```
Note: if you're using the `.dotfiles/zsh/.zshrc` the tool will automatically
detect if `tmux` is installed and set the alias accordingly.

## Kitty
To load the `kitty.conf` file from the `.dotfiles` add the following to your
global `kitty.conf` file, on MacOS at `~/.config/kitty/kitty.conf`:
```
include /Users/jefo/.dotfiles/kitty/kitty.conf
```
Note: I had no luck using environment variables, so I had to hardcode the
location for the `.dotfiles`'s `kitty.conf`.

## VIM
To load hte `.vimrc` from the `.dotfiles` add the following to your global
`~/.vimrc` file:
```
source $HOME/.dotfiles/vim/.vimrc
```

## Git
To load the `.gitconfig` from the `.dotfiles` add the following to your global
`.gitconfig` file:
```
[include]
    path = $HOME/.dotfiles/git/.gitconfig
```
Or run the following piece of code to have it do it for you:
```
echo "[include]\n\tpath = $HOME/.dotfiles/git/.gitconfig" >> ~/.gitconfig
```

