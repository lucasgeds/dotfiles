script_dir="$(cd "$(dirname "$0")"; pwd -P)"

if [ -f ~/.zshrc ]; then
	echo "Moving ~/.zshrc to ~/.zshrc.bkp..."
	mv ~/.zshrc ~/.zshrc.bkp
fi
echo "Symlinking ~/.zshrc..."
ln -s $script_dir/.zshrc ~/.zshrc

if [ -f ~/.gitignore ]; then
	echo "Moving ~/.gitignore to ~/.gitignore.bkp..."
	mv ~/.gitignore ~/.gitignore.bkp
fi
echo "Symlinking ~/.gitignore..."
ln -s $script_dir/.gitignore ~/.gitignore

if [ -f ~/.tool-versions ]; then
	echo "Moving ~/.tool-versions to ~/.tool-versions.bkp..."
	mv ~/.tool-versions ~/.tool-versions.bkp
fi
echo "Symlinking ~/.tool-versions..."
ln -s $script_dir/.tool-versions ~/.tool-versions

if [ -f ~/.vimrc ]; then
	echo "Moving ~/.vimrc to ~/.vimrc.bkp..."
	mv ~/.vimrc ~/.vimrc.bkp
fi
if [ -f ~/.config/nvim/init.vim ]; then
	echo "Moving ~/.config/nvim/init.vim to ~/.config/nvim/init.vim.bkp..."
	mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bkp
fi
echo "Symlinking ~/.vimrc..."
ln -s $script_dir/.vimrc ~/.vimrc
echo "Symlinking ~/.config/nvim/init.vim..."
ln -s $script_dir/.vimrc ~/.config/nvim/init.vim

echo "Done!"
