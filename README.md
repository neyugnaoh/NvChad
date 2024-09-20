# Install Vim-Plug
## Linux Ubuntu
- Install Vim
```bash
sudo apt update
sudo apt install vim
```
- Install ripgrep
```bash
sudo apt-get install ripgrep
```
# Install Vim-plug
## MacOS or Linux

```zsh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Windows

```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME\AppData\Local\nvim\autoload\plug.vim -Force
```
