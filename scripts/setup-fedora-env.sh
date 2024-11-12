sudo dnf update -y
sudo dnf groupinstall "KDE Applications"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video
sudo dnf install neofetch git kde-partitionmanager tlp tlp-rdw snapd zsh -y --skip-unavailable
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload
sudo systemctl enable --now  tlp
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /
sudo snap install code thunderbird pycharm-community 
flatpak install flathub io.github.zen_browser.zen

zsh -c "$(curl -fsSL https://raw.githubusercontent.com/MemoKing34/setup-termux-env/refs/heads/master/scripts/setup.zsh)"