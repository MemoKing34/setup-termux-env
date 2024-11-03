To Setup Termux Environment,Run

```bash
pkg install git -y
git clone https://github.com/MemoKing34/setup-termux-env
cd setup-termux-env
bash scripts/setup-termux-env.sh
```

or you can use this single line command
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/MemoKing34/setup-termux-env/refs/heads/master/install.sh)"
```

if you want to apply only zsh scripts run `scripts/setup.zsh` or this script
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/MemoKing34/setup-termux-env/refs/heads/master/scripts/setup.zsh)"
```