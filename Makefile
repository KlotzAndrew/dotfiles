.PHONY: all
all: gitfiles shellfiles vim tmux

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
install:
	ln -sf "$(CURDIR)/.vim/vimrc" "$(HOME)/.vimrc"

.PHONY: tmux
tmux:
	ln -sf $(CURDIR)/.tmux/.tmux.conf $(HOME)/.tmux.conf;

.PHONY: update
update:
	git submodule update --init --recursive
	git submodule foreach git pull --recursive-submodules origin master
