#!/bin/bash

install_golang() {
	export GO_VERSION
	GO_VERSION=$(curl -sSL "https://golang.org/VERSION?m=text")
	export GO_SRC=/usr/local/go

	# if we are passing the version
	if [[ ! -z "$1" ]]; then
		GO_VERSION=$1
	fi

	# purge old src
	if [[ -d "$GO_SRC" ]]; then
		sudo rm -rf "$GO_SRC"
		sudo rm -rf "$GOPATH"
	fi

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

usage() {
	echo -e "install.sh\\n\\tThis script installs my basic setup\\n"
	echo "Usage:"
	echo "  base                                - setup sources & install base pkgs"
	echo "  dotfiles                            - get dotfiles"
	echo "  golang                              - install golang and packages"
}

main() {
	local cmd=$1

	if [[ -z "$cmd" ]]; then
		usage
		exit 1
	fi

	if [[ $cmd == "dotfiles" ]]; then
    exit 1
	elif [[ $cmd == "base" ]]; then
		exit 1
	elif [[ $cmd == "golang" ]]; then
		install_golang "$2"
	else
		usage
	fi
}

main "$@"
