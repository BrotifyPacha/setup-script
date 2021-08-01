cd ~

echo "Downloading nvim appimage"
wget -q https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage

echo "Extracting appimage"
chmod 777 ./nvim.appimage
./nvim.appimage --appimage-extract > /dev/null 2>&1
rm ./nvim.appimage

mkdir -p ~/.local/nvim
rm -rf ~/.local/nvim/*
mv ./squashfs-root/usr/* ~/.local/nvim/
rm -rf ./squashfs-root
echo "Image extracted to ~/.local/nvim/bin/nvim"

echo "Cloning config"
if [ -d ~/.config/nvim ] ; then
    rm -rf ~/.config/nvim
fi
mkdir -p ~/.config && cd ~/.config
git clone http://github.com/brotifypacha/nvim > /dev/null 2>&1

echo "Done!"