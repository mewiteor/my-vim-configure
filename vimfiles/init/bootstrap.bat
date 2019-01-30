@echo off
git submodule init
git submodule update
mkdir ../autoload
copy ../pack/plugins/start/vim-plug/plug.vim ../autoload/plug.vim
