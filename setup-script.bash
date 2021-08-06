cd ~

echo "Downloading nvim appimage"
wget -q https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage

echo "Extracting appimage"
chmod 777 ./nvim.appimage
./nvim.appimage --appimage-extract > /dev/null 2>&1
rm ./nvim.appimage

mkdir -p ~/.local/neovim
rm -rf ~/.local/neovim/*
mv ./squashfs-root/usr/* ~/.local/neovim/
rm -rf ./squashfs-root
echo "Image extracted to:"
echo "    ~/.local/neovim/bin/nvim"

echo "Cloning config"
if [ -d ~/.config/nvim ] ; then
    rm -rf ~/.config/nvim
fi
mkdir -p ~/.config && cd ~/.config
git clone http://github.com/brotifypacha/nvim > /dev/null 2>&1

echo "Installing Neovim plugins"
~/.local/neovim/bin/nvim -c 'PlugInstall | so $MYVIMRC | qa!'

echo "Done!"
