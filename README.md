# dotfiles

#### Up and running mostly use maintained repos:

 * zsh
 * `chsh -s $(which zsh)`
 * vim
 * tmux
 * oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
 * yadr (https://github.com/skwp/dotfiles)

#### Install dotfiles
```shell
 git clone https://github.com/KlotzAndrew/dotfiles.git ~/dotfiles
 cd ~/dotfiles
 rake install
```

#### Atom setup

Install Atom then:

```shell
git clone https://github.com/KlotzAndrew/atom-config.git ~/temp-atom-config
cd ~/temp-atom-config
mv ~/temp-atom-config/.git ~/.atom
rm -rf ~/temp-atom-config
cd ~/.atom
git checkout --force master
```
