#!/bin/bash

set -e

install_golang() {
	export GO_VERSION
	GO_VERSION=$(curl -sSL "https://golang.org/VERSION?m=text")
	export GO_SRC=/usr/local/go

	# if we are passing the version
	if [[ ! -z "$1" ]]; then
		GO_VERSION=$1
	fi

	# purge old src
	# if [[ -d "$GO_SRC" ]]; then
	# 	sudo rm -rf "$GO_SRC"
	# 	sudo rm -rf "$GOPATH"
	# fi

	GO_VERSION=${GO_VERSION#go}

	# subshell
	(
	kernel=$(uname -s | tr '[:upper:]' '[:lower:]')
	curl -sSL "https://storage.googleapis.com/golang/go${GO_VERSION}.${kernel}-amd64.tar.gz" | sudo tar -v -C /usr/local -xz
	local user="$USER"
	# rebuild stdlib for faster builds
	sudo chown -R "${user}" /usr/local/go/pkg
	CGO_ENABLED=0 go install -a -installsuffix cgo std
	)
}

install_rust() {
	curl https://sh.rustup.rs -sSf | sh
}

install_ruby() {
	# for ubunut: https://stackoverflow.com/a/54440419
	curl -sSL https://get.rvm.io | bash -s stable
	rvm reload
	rvm install ruby --latest --default

	gem install bundler
	gem install rails
}

install_node() {
	git clone https://github.com/creationix/nvm.git ~/.nvm
	# shellcheck disable=SC1090
	source "$HOME"/.nvm/nvm.sh

	nvm install --lts # install and set the latest lts versino
	nvm alias default "$(node --version)"

	command -v nvm
}

install_kubectl() {
	kernel=$(uname -s | tr '[:upper:]' '[:lower:]')
  kubernetes_version=$(curl -sSL https://storage.googleapis.com/kubernetes-release/release/stable.txt)
	curl -LO https://storage.googleapis.com/kubernetes-release/release/"$kubernetes_version"/bin/"$kernel"/amd64/kubectl > /usr/local/bin/kubectl
	chmod +x /usr/local/bin/kubectl
	echo "kuebctl $(kubectl version --client --short)"
}

install_gcloud() {
  curl https://sdk.cloud.google.com | bash
}

install_node() {
	cd ~/
	[ ! -d .nvm ] && git clone https://github.com/nvm-sh/nvm.git .nvm
	cd ~/.nvm
	git checkout v0.34.0
	# shellcheck disable=SC1091
	. nvm.sh

	nvm install 'lts/*'
	nvm alias default 'lts/*'
}

install_java() {
	apt install openjdk-8-jre
	java -version
}

install_clojure() {
	curl -O https://download.clojure.org/install/linux-install-1.10.1.536.sh
	chmod +x linux-install-1.10.1.536.sh
	./linux-install-1.10.1.536.sh

	sudo apt-get install -y leiningen
}

install_yubico() {
	sudo add-apt-repository ppa:yubico/stable
	sudo apt-get update

	sudo apt-get install \
		pcscd scdaemon gnupg2 pcsc-tools

	sudo apt-get install \
		yubikey-manager \
		yubioath-desktop \
		yubikey-personalization-gui
}

install_docker() {
	sudo apt-get install \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88

	sudo add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable"

	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io

	if [ ! "$(getent group docker)" ]; then
		sudo groupadd docker
	fi

	sudo usermod -aG docker "$USER"
	newgrp docker

	sudo systemctl enable docker

	docker --version
}

base() {
	sudo apt-get update
	sudo apt-get upgrade

	sudo apt-get install \
		build-essential \
		curl \
		sudo \
		vim \
		tmux \
		software-properties-common \
		locales \
		git

	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb
	sudo dpkg -i ripgrep_0.9.0_amd64.deb
	rm ripgrep_0.9.0_amd64.deb

	curl -LO https://github.com/sharkdp/fd/releases/download/v7.1.0/fd-musl_7.1.0_amd64.deb
	sudo dpkg -i fd-musl_7.1.0_amd64.deb
	rm fd-musl_7.1.0_amd64.deb

	sudo apt-add-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install neovim

	# locale -a
	echo "LC_ALL=en_US.UTF-8" | sudo tee -a /etc/environment
	echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
	echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf
	sudo locale-gen en_US.UTF-8

	export LC_CTYPE=en_US.UTF-8
	export LC_ALL=en_US.UTF-8
}

usage() {
	echo -e "install.sh\\n\\tThis script installs my basic setup\\n"
	echo "Usage:"
	echo "  base                                - setup sources & install base pkgs"
	echo "  dotfiles                            - get dotfiles"
	echo "  golang                              - install golang and packages"
	echo "  rust                                - install rust"
	echo "  ruby                                - install ruby"
	echo "  node                                - install node"
	echo "  kubectl                             - install kubectl"
}

main() {
	local cmd="$1"

	if [[ -z "$cmd" ]]; then
		usage
		exit 1
	fi

	if [[ "$cmd" == "dotfiles" ]]; then
		exit 1
	elif [[ "$cmd" == "base" ]]; then
		base
	elif [[ "$cmd" == "golang" ]]; then
		install_golang "$2"
	elif [[ "$cmd" == "rust" ]]; then
		install_rust
	elif [[ "$cmd" == "ruby" ]]; then
		install_ruby
	elif [[ "$cmd" == "node" ]]; then
		install_node
	elif [[ "$cmd" == "kubectl" ]]; then
		install_kubectl
	elif [[ "$cmd" == "yubico" ]]; then
		install_yubico
	elif [[ "$cmd" == "docker" ]]; then
		install_docker
	else
		usage
	fi
}

main "$@"
