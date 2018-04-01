.PHONY: all
all: gitfiles shellfiles

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
