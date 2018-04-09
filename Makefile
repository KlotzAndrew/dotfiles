XDG_CONFIG_HOME := $(HOME)/.config

.PHONY: all
all: gitfiles shellfiles vim update tmux

.PHONY: gitfiles
gitfiles:
	for file in $(shell find $(CURDIR)/git -type f); do \
		f=$$(basename $$file); \
		ln -sf $$file $(HOME)/$$f; \
	done;

.PHONY: shellfiles
shellfiles:
	for file in $(shell find $(CURDIR)/shell -type f); do \
		f=$$(basename $$file); \
		ln -sf $$file $(HOME)/$$f; \
	done;

.PHONY: extras
extras:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

.PHONY: vim
vim:
	mkdir -p "$(XDG_CONFIG_HOME)"
	ln -snf "$(CURDIR)/.vim/vimrc" "$(HOME)/.vimrc"
	ln -snf "$(CURDIR)/.vim" "$(XDG_CONFIG_HOME)/nvim"
	ln -snf "$(CURDIR)/.vim/vimrc" "$(XDG_CONFIG_HOME)/nvim/init.vim"
	sudo mkdir -p /root/.config
	sudo ln -snf "$(CURDIR)/.vim" /root/.vim
	sudo ln -snf "$(CURDIR)/.vim/vimrc" /root/.vimrc
	sudo ln -snf "$(CURDIR)/.vim" /root/.config/nvim
	sudo ls -snf "$(CURDIR)/.vim/vimrc" /root/.config/nvim/init.vim

.PHONY: tmux
tmux:
	ln -sf $(CURDIR)/.tmux/.tmux.conf $(HOME)/.tmux.conf;

.PHONY: update
update:
	git submodule update --init --recursive
	git submodule foreach git pull origin master
