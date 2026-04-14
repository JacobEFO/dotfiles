##############################################################################3
# 
#
# Description:
# 	Add check for WSL / Fedora
#
##############################################################################3

echo "Welcome to JEFO's Fedora/WSL installation script"


sudo dnf install vim bat fd-find ripgrep btop ranger tmux wget
# sudo dnf install bat
# sudo dnf install fd-find
# sudo dnf install ripgrep
# sudo dnf install btop
# sudo dnf install ranger
# sudo dnf install tmux
# sudo dnf install wget
sudo dnf copr enable alternateved/eza
sudo dnf install eza

# I don't think these fonts are correct, they seem not to work.
#cd
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
#mkdir -p .local/share/fonts
#unzip Meslo.zip -d .local/share/fonts
#cd .local/share/fonts
#rm *Windows*
#cd
#rm Meslo.zip
#fc-cache -fv
# Install them through powerlevel10k's link instead.

# create ssh key
# add ssh to config file

git clone git@github.com:JacobEFO/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
git submodule update --init --recursive

# Install zsh
# change to zsh
# Add oh-my-zsh
# Add powerlevel10k
# Install MesloLGS
# remove .zshrc
# source $HOME/.dotfiles/zsh/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode

# Vim
cd
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Install KiCad
sudo dnf install dnf-plugins-core
dnf copr enable @kicad/kicad-testing
dnf install kicad
# Update KiCad colors / keybinds / dracula
# In $HOME/.config/kicad add links to MEGA/Electronics/KiCad/setup

# Install MEGA
wget https://mega.nz/linux/repo/Fedora_43/x86_64/megasync-Fedora_43.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_43.x86_64.rpm"

# Install Sublime Text 4
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager addrepo --from-repofile=https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install sublime-text

# Install netbird
sudo tee /etc/yum.repos.d/netbird.repo <<EOF
[netbird]
name=netbird
baseurl=https://pkgs.netbird.io/yum/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.netbird.io/yum/repodata/repomd.xml.key
repo_gpgcheck=1
EOF
sudo dnf config-manager addrepo --from-repofile=/etc/yum.repos.d/netbird.repo
netbird up --management-url https://bird.lotus-microsystems.com --disable-auto-connect

# Largely manually controlled installations
# Install FreeCad (Installs via AppImage)
# Install Klayout (Install via Discover / Flathub)
# Install Anaconda
# Install OnlyOffice
# Install STM32CubeIDE
# Install STM32CubeMX
# Install ThinLinc
# Install Dropbox (Installs via Flatpak)
# Install Spotify (Installs via Flatpak)
sudo flatpak install flathub com.spotify.Client

# Install arm & stm32 command-line tools
sudo dnf install arm-none-eabi-gcc arm-none-eabi-newlib arm-none-eabi-gcc-cs stlink

# Install Remmina
sudo dnf copr enable hubbitus/remmina-next
sudo dnf remmina


# Install Discord
sudo flatpak install flathub discord
