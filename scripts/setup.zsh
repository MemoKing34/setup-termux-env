if [[ -d ~/.oh-my-zsh ]]; then
    echo 'Oh my zsh already installed!'
else
    rm -rf ~/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if [ "$(basename -- "$SHELL")" != "zsh" ]; then
    if [ -n "$TERMUX_VERSION" ]; then
        chsh -s zsh
    else
        chsh -s $(which zsh)
    fi
fi


export THEMES=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes
export PLUGINS=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins


echo 'Installing powerlevel10k'
if [[ -d $THEMES/powerlevel10k ]]; then
    echo 'Powerlevel10k already installed!'
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $THEMES/powerlevel10k -q
    echo 'Powerlevel10k installed'
fi
echo 'Setting p10k dotfiles'
touch ~/.zshrc ~/.p10k.zsh
if [[ -d dots ]]; then
    cp -rf dots/.zshrc ~/.zshrc
    cp -rf dots/.p10k.zsh ~/.p10k.zsh
else
    curl -fsSL https://raw.githubusercontent.com/MemoKing34/setup-termux-env/refs/heads/master/dots/.zshrc -o ~/.zshrc
    curl -fsSL https://raw.githubusercontent.com/MemoKing34/setup-termux-env/refs/heads/master/dots/.p10k.zsh -o ~/.p10k.zsh
fi


install_plugin() {
    test -d "$PLUGINS/${3:-$2}" || git clone https://github.com/$1/$2.git $PLUGINS/${3:-$2} -q && _omz::plugin::enable ${3:-$2}
}


echo 'Setting oh my zsh! configs'
source ~/.zshrc

_omz::plugin::enable example # this is for applying your custom settings

_omz::plugin::enable python vscode pip pyenv zsh-interactive-cd
_omz::theme::set powerlevel10k/powerlevel10k

echo 'Installing extra plugins for oh my zsh'
install_plugin zsh-users zsh-autosuggestions
install_plugin zsh-users zsh-syntax-highlighting
install_plugin MichaelAquilina zsh-you-should-use
install_plugin fdellwing zsh-bat
install_plugin TamCore autoupdate-oh-my-zsh-plugins autoupdate
install_plugin MemoKing34 zsh-lsd
echo 'Extra plugins installed'


echo 'Oh my zsh setted =)'
