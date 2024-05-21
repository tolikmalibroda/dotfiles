NVIM_CONFIG_DIR = $(HOME)/.config/nvim
TMUX_CONFIG_DIR = $(HOME)/.tmux
TMUX_CONFIG_FILE = $(HOME)/.tmux.conf
BREW = "brew install"
APT = "apt update && apt install"

install-all: install-tmux install-nvim install-jq install-direnv

brew-install-tmux:
	$(BREW) tmux
	make config-tmux

apt-install-tmux:
	$(APT) tmux
	make config-tmux

config-tmux:
	rm -f $(TMUX_CONFIG_FILE)
	cp ./tmux/.tmux.conf $(TMUX_CONFIG_FILE)
	git clone https://github.com/tmux-plugins/tpm $(TMUX_CONFIG_DIR)/plugins/tpm

brew-install-nvim:
	$(BREW) neovim
	make config-nvim

apt-install-nvim:
	$(APT) neovim
	make config-nvim

config-nvim:
	git clone https://github.com/antl-m/kickstart.nvim.git $(NVIM_CONFIG_DIR)

rm-nvim-git-deps:
	rm -rf $(NVIM_CONFIG_DIR)/.git
	rm -rf $(NVIM_CONFIG_DIR)/.github
	rm -rf $(NVIM_CONFIG_DIR)/.gitignore

brew-install-jq:
	$(BREW) jq

apt-install-jq:
	$(APT) jq

brew-install-direnv:
	$(BREW) direnv

apt-install-direnv:
	$(APT) direnv

