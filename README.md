
# dev-env

### Personal development environment configuration:
- **tmux** with config (tpm, theme, key bindings)
- **Neovim** with config

---

### Installation

Configuration and tools are crossplatform,
but installation script currently works only for MacOS.

To install once, execute:
```bash
eval $(curl https://raw.githubusercontent.com/antl-m/dev-env/main/install.sh)
```

Or clone repository to be able to push configs updates:
```bash
git clone https://github.com/antl-m/dev-env.git
cd ./dev-env
make install-all
```

---

### Useful things

You may want to add this to your `~/.zshrc` or `~/.bashrc`:
```bash
# set default editor
export EDITOR="nvim"

# enable vi mode in terminal
bindkey -v
```

