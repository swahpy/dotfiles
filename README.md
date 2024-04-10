# dotfiles

This project is about the dotfiles for my daily usage.

## .bashrc
In order to successfully use `.bashrc`, please install starship first, `curl -sS https://starship.rs/install.sh | sh`. For more details, refer to [starship guide](https://starship.rs/guide/).

## .blerc
Configuration for ble.sh.
```
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
```
Refer to [ble.sh github repo](https://github.com/akinomyoga/ble.sh).

## .tmux.conf
Configuration for tmux.

## .config/nvim
Configuration for nvim. In progress...
