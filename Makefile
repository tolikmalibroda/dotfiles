install-all: install-tmux install-nvim

install-tmux:
	brew install tmux
	cp ./tmux/.tmux.conf ~/.tmux.conf
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

install-nvim:
	brew install neovim
	git clone https://github.com/antl-m/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

