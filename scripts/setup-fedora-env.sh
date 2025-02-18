read -p "Active flathub from your store app and hit enter"


echo 'Running dnf update, will ask sudo password'
sudo dnf update -y

echo 'Installing KDE'
sudo dnf groupinstall "KDE Applications"

sudo 'Activating RPM Fusion repos'
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y

echo 'Some sound staff'
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

echo 'Installing additional packages'
sudo dnf install neofetch git kde-partitionmanager tlp tlp-rdw snapd zsh -y --skip-unavailable --skip-broken

echo 'Enabling  tlp and snap services'
sudo systemctl enable --now  tlp
sudo systemctl enable --now snapd.socket

echo 'Setting snap'
sudo ln -s /var/lib/snapd/snap /
echo 'Installing additional snap packages'
sudo snap install code thunderbird pycharm-community
echo 'Installing zen browser from flathub' 
flatpak install flathub io.github.zen_browser.zen

if [[ -f setup.zsh ]]; then
    zsh setup.zsh
else
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/MemoKing34/setup-termux-env/refs/heads/master/scripts/setup.zsh)"
fi


echo "Fedora setup done =)"