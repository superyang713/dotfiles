#!/bin/sh

download_repo()
{
    cd ~
    echo "Downloading all config files from Yang's repo"
    git clone --quiet https://github.com/superyang713/vimrc-and-plugins

    echo "Preparing for vim plugins download"
    cd vimrc-and-plugins/vim_plugins/bundle/

    echo "Downloading nerdtree..."
    git clone --quiet https://github.com/jistr/vim-nerdtree-tabs.git
    git clone --quiet https://github.com/scrooloose/nerdtree.git
    echo "Downloading powerline..."
    git clone --quiet https://github.com/powerline/powerline.git
    echo "Downloading sensible..."
    git clone --quiet https://github.com/tpope/vim-sensible.git
    echo "Downloading python-mode..."
    git clone --recursive --quiet https://github.com/python-mode/python-mode
    echo "Downloading sparkup..."
    git clone --quiet https://github.com/rstacruz/sparkup.git
    echo "Downloading tlib_vim..."
    git clone --quiet https://github.com/tomtom/tlib_vim.git
    echo "Downloading snippets..."
    git clone --quiet https://github.com/honza/vim-snippets.git
    git clone --quiet https://github.com/MarcWeber/vim-addon-mw-utils.git
    echo "Downloading snipmate..."
    git clone --quiet https://github.com/garbas/vim-snipmate.git
    echo "Downloading ctrlp..."
    git clone --quiet https://github.com/kien/ctrlp.vim.git
    echo "Downloading solarize..."
    git clone --quiet https://github.com/altercation/vim-colors-solarized.git

    cd ~/vimrc-and-plugins
}

install_vimrc()
{
    echo "installing vimrc"
    cp vimrc ~/.vimrc
}

install_vim_plugins()
{
    echo "installing all vim plugins"
    rm -rf ~/.vim
    cp -r vim_plugins ~/.vim
}

install_tmux_config()
{
    echo "Transferring new tmux config file"
    cp tmux.conf ~/.tmux.conf
}

install_zsh()
{
    echo "Transfering .zshrc"
    cp zshrc ~/.zshrc
    echo "installing zsh"
    sudo apt install zsh
    echo "installing oh-my-zsh"
    git clone --quiet https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    chsh -s /usr/bin/zsh
}

finalize()
{
    echo "cleaning up..."
    echo "removing unsed files..."
    rm -rf ~/vimrc-and-plugins
    exec /usr/bin/zsh
}

help_message()
{
    echo "If text is not displayed properly after terminal restart, please \
install the font -- Shure Tech Mono Nerd Font Complete Mono"
}

echo "The installation will replace your current vimrc, zshrc, and vim plugins,
are you sure to proceed? (y/n)"

read resp

if [ $resp = "y" ]; then
    download_repo
    install_vimrc
    install_vim_plugins

    source ~/.vimrc

    install_tmux_config
    install_zsh
    help_message
    finalize
else
    echo "oh no"
fi;
