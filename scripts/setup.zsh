test -d .oh-my-zsh || rm -rf .oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s zsh


export THEMES=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
export PLUGINS=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins


echo 'Installing powerlevel10k'
if [[ $(test -d $THEMES/powerlevel10k) ]]; then
    echo 'Powerlevel10k already installed!'
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $THEMES/powerlevel10k
    echo 'Powerlevel10k installed'
fi
echo 'Setting p10k dotfiles'
touch ~/.zshrc ~/.p10k.zsh
cp -rf dots/.zshrc ~/.zshrc
cp -rf dots/.p10k.zsh ~/.p10k.zsh




echo 'Installing extra plugins for oh my zsh'
test -d "$PLUGINS/zsh-autosuggestions" || git clone https://github.com/zsh-users/zsh-autosuggestions $PLUGINS/zsh-autosuggestions
test -d "$PLUGINS/zsh-syntax-highlighting" || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGINS/zsh-syntax-highlighting
test -d "$PLUGINS/you-should-use" || git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $PLUGINS/you-should-use
test -d "$PLUGINS/zsh-bat" || git clone https://github.com/fdellwing/zsh-bat.git $PLUGINS/zsh-bat
echo 'Extra plugins installed'