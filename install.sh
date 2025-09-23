echo "Welcome to JEFO's Fedora installation script"

sudo dnf install vim
sudo dnf install bat
sudo dnf install fd-find
sudo dnf install ripgrep
sudo dnf install btop
sudo dnf install ranger
sudo dnf install tmux
sudo dnf install wget
sudo dnf copr enable alternateved/eza
sudo dnf install eza

cd
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
mkdir -p .local/share/fonts
unzip Meslo.zip -d .local/share/fonts
cd .local/share/fonts
rm *Windows*
cd
rm Meslo.zip
fc-cache -fv

# create ssh
# add ssh to config file

git clone git@github.com:JacobEFO/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
git submodule update --init --recursive

# Install zsh
# change to zsh
# Add oh-my-zsh
# Add powerlevel10k
# remove .zshrc
# source $HOME/.dotfiles/zsh/.zshrc

# copy btop template

cd

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula
