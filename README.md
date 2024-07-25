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

## Btop
Move the `.dotfiles/btop/themes/dracula.theme` to the shared location at
`/usr/share/btop/themes` if not present there already.

To also load this correct, the `$XDG_CONFIG_HOME` must be pointing to the
location of your `.dotfiles/` location. By default this location is at
`$HOME/.dotfiles/` and the `$XDG_CONFIG_HOME` can be set with:
```
export XDG_CONFIG_HOME=$HOME/.dotfies
```

If you're using the `.dotfiles/zsh/.zshrc` this is already set for you via the
`.linux.zshrc` file.

Note: if you're running on MacOS this is NOT the case.

## Ranger
Make sure the `rifle.sh` is executable. You can achieve this by using `chmod`:
```
chmod u+x ~/.dotfiles/ranger/rifle.sh
```

Run ranger with the following alias to use the `.dotfiles/ranger` as your
configuration directory.
```
alias ranger='ranger --confdir=$HOME/.dotfiles/ranger'
```

If you're using the `.dotfiles/zsh/.zshrc` this is automatically set for you
once it detects `ranger`.
