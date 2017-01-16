# dotfiles

#### Getting up and running
```shell
git clone https://github.com/KlotzAndrew/dotfiles.git ~/dotfiles
cd ~/dotfiles
sh setup.sh

# install dotfiles
rake install --trace
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

#### Languages:
```shell
sh languages/ruby.sh # installed by default
```
