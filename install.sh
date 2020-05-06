#!/bin/bash
OS=$(uname)
script_dir="$(cd "$(dirname "$0")"; pwd -P)"

if [ -f ~/.zshrc ]; then
  echo "Moving ~/.zshrc to ~/.zshrc.bkp..."
  mv ~/.zshrc ~/.zshrc.bkp
fi
echo "Symlinking ~/.zshrc..."
ln -sf $script_dir/.zshrc ~/.zshrc

if [ -f ~/.gitignore ]; then
  echo "Moving ~/.gitignore to ~/.gitignore.bkp..."
  mv ~/.gitignore ~/.gitignore.bkp
fi
echo "Symlinking ~/.gitignore..."
ln -sf $script_dir/.gitignore ~/.gitignore

if [ -f ~/.tool-versions ]; then
  echo "Moving ~/.tool-versions to ~/.tool-versions.bkp..."
  mv ~/.tool-versions ~/.tool-versions.bkp
fi
echo "Symlinking ~/.tool-versions..."
ln -sf $script_dir/.tool-versions ~/.tool-versions

if [ -f ~/.vimrc ]; then
  echo "Moving ~/.vimrc to ~/.vimrc.bkp..."
  mv ~/.vimrc ~/.vimrc.bkp
fi

if [ -f ~/.config/nvim/init.vim ]; then
  echo "Moving ~/.config/nvim/init.vim to ~/.config/nvim/init.vim.bkp..."
  mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bkp
fi
echo "Symlinking ~/.vimrc..."
ln -sf $script_dir/.vimrc ~/.vimrc
echo "Symlinking ~/.config/nvim/init.vim..."
mkdir -p ~/.config/nvim
ln -sf $script_dir/.vimrc ~/.config/nvim/init.vim

linux() {
  case $DISTRO in
    debian)
      apt-get -y update ; apt-get -y install vim neovim git curl yarn npm
      ;;
    ubuntu)
      apt-get -y update ; apt-get -y install vim neovim git curl yarn npm
      ;;
    fedora)
      dnf -y update; cnf -y install neovim vim git curl node yarn npm
      ;;
    *)
      echo nenhum...
      ;;
  esac
}

if [ $OS = "Linux" ]
then
  DISTRO=$(cat /etc/*release | grep ^ID= | awk -F '=' '{print $2}' | sed 's/\"//g')
  echo "Linux ${DISTRO}"
  linux
else
  yes | brew install neovim curl git yarn npm
fi

if [ ! -z $(which vim) ]
then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Plug vim installed"
fi

if [ ! -z $(which nvim) ]
then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Plug neovim installed"
fi
echo "Done!"
