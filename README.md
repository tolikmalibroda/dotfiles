
# dev-env

### Personal development environment configuration:
- **tmux** -- terminal session manager + config
- **Neovim** -- text editor + config
- **jq** -- CLI tool for processing JSON files
- **direnv** -- tool for loading directory-based environments

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

