XDG_CONFIG_HOME := $(HOME)/.config

.PHONY: all
all: gitfiles shellfiles vim tmux bin

.PHONY: gitfiles
gitfiles:
	for file in $(shell find $(CURDIR)/git -type f); do \
		f=$$(basename $$file); \
		ln -sf $$file $(HOME)/.$$f; \
	done;

.PHONY: shellfiles
shellfiles:
	for file in $(shell find $(CURDIR)/shell -type f); do \
		f=$$(basename $$file); \
		ln -sf $$file $(HOME)/.$$f; \
	done;

.PHONY: vim
vim:
	mkdir -p "$(XDG_CONFIG_HOME)"
	ln -snf "$(CURDIR)/vim/vimrc" "$(HOME)/.vimrc"
	ln -snf "$(CURDIR)/vim" "$(HOME)/.vim"
	ln -snf "$(CURDIR)/vim" "$(XDG_CONFIG_HOME)/nvim"
	ln -snf "$(CURDIR)/vim/vimrc" "$(XDG_CONFIG_HOME)/nvim/init.vim"

.PHONY: tmux
tmux:
	ln -sf $(CURDIR)/tmux/tmux.conf $(HOME)/.tmux.conf;

.PHONY: bin
bin: ## Installs the bin directory files.
	for file in $(shell find $(CURDIR)/bin -type f -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$f; \
	done

.PHONY: fzf
fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

.PHONY: update_sub
update_sub:
	git submodule update --init --recursive
	git submodule foreach git pull origin master

.PHONY: update_gitdiff
update_gitdiff:
	echo "find the compiled version locally"
