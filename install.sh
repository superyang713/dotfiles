# Still working on it.
echo "The installation will replace your current vimrc, zshrc, and vim plugins,
are you sure to proceed? (y/n)"

read resp

if [ $resp = "y" ]; then
    git clone https://github.com/superyang713/vimrc-and-plugins
else
    echo "oh no"
fi;
