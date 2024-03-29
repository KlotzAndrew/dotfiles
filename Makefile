XDG_CONFIG_HOME := $(HOME)/.config

.PHONY: all
all: gitfiles shellfiles vim tmux bin update_sub

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

	gpg --list-keys || true;
	ln -sfn $(CURDIR)/gnupg/gpg.conf $(HOME)/.gnupg/gpg.conf;
	ln -sfn $(CURDIR)/gnupg/gpg-agent.conf $(HOME)/.gnupg/gpg-agent.conf;
	ln -sfn $(CURDIR)/htop $(HOME)/.config/htop;

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

.PHONY: add_submodule
add_submodule:
	#	git submodule add <remote_url> <destination_folder>
	# git submodule add https://github.com/jiangmiao/auto-pairs vim/bundle/auto-pairs

.PHONY: rm_submodule
rm_submodule:
	# https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule/7646931#7646931
	# git submodule deinit <submodule>
	# git rm <submodule>

.PHONY: update_gitdiff
update_gitdiff:
	echo "find the compiled version locally"

.PHONY: test
test:
	docker run --rm \
		-v "${CURDIR}":/usr/src \
		--workdir /usr/src \
		klotzandrew/shellcheck ./test.sh
