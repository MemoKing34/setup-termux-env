if [[ $(test -d ~/.oh-my-zsh) ]]; then
    echo 'Oh my zsh already installed!'
else
    rm -rf ~/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [ "$(basename -- "$SHELL")" != "zsh" ]; then
    chsh -s $(which zsh)
fi


export THEMES=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
export PLUGINS=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins


echo 'Installing powerlevel10k'
if [[ $(test -d $THEMES/powerlevel10k) ]]; then
    echo 'Powerlevel10k already installed!'
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $THEMES/powerlevel10k -q
    echo 'Powerlevel10k installed'
fi
echo 'Setting p10k dotfiles'
touch ~/.zshrc ~/.p10k.zsh
if [[ $(test -d dots) ]]; then
    cp -rf dots/.zshrc ~/.zshrc
    cp -rf dots/.p10k.zsh ~/.p10k.zsh
else
    curl -fsSL https://raw.githubusercontent.com/MemoKing34/setup-termux-env/refs/heads/master/dots/.zshrc -o ~/.zshrc
    curl -fsSL https://raw.githubusercontent.com/MemoKing34/setup-termux-env/refs/heads/master/dots/.p10k.zsh -o ~/.p10k.zsh
fi




echo 'Installing extra plugins for oh my zsh (zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-bat)'
test -d "$PLUGINS/zsh-autosuggestions" || git clone https://github.com/zsh-users/zsh-autosuggestions $PLUGINS/zsh-autosuggestions -q
test -d "$PLUGINS/zsh-syntax-highlighting" || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGINS/zsh-syntax-highlighting -q
test -d "$PLUGINS/you-should-use" || git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $PLUGINS/you-should-use -q
test -d "$PLUGINS/zsh-bat" || git clone https://github.com/fdellwing/zsh-bat.git $PLUGINS/zsh-bat -q
echo 'Extra plugins installed'