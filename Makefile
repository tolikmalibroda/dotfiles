NVIM_CONFIG_DIR = ${XDG_CONFIG_HOME:-$(HOME)/.config}/nvim
TMUX_CONFIG_DIR = $(HOME)/.tmux
TMUX_CONFIG_FILE = $(HOME)/.tmux.conf

install-all: install-tmux install-nvim

install-tmux:
	brew install tmux
	cp ./tmux/.tmux.conf $(TMUX_CONFIG_FILE)
	git clone https://github.com/tmux-plugins/tpm $(TMUX_CONFIG_DIR)/plugins/tpm

install-nvim:
	brew install neovim
	git clone https://github.com/antl-m/kickstart.nvim.git $(NVIM_CONFIG_DIR)

rm-nvim-git-deps:
	rm -rf $(NVIM_CONFIG_DIR)/.git
	rm -rf $(NVIM_CONFIG_DIR)/.github
	rm -rf $(NVIM_CONFIG_DIR)/.gitignore

