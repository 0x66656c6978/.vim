#!/bin/sh

BASEDIR=$(dirname "$0")

if [ ! -d $HOME/.fzf ] ; then
    echo Installing fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

echo Installing pathogen
if [ ! -d "$HOME/.vim/autoload" ] || [ ! -d "$HOME/.vim/bundle" ]; then
    mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/bundle"
    curl -LSso "$HOME/.vim/autoload/pathogen.vim" "https://tpo.pe/pathogen.vim"
fi

echo Installing pathogen bundles from git repositories to $HOME/.vim/bundle
cd "$HOME/.vim/bundle"
cat "$BASEDIR/.bundle-list" | while read -r URL; do git clone $URL; done

if [ -f $HOME/.vimrc ] ; then
    mv "$HOME/.vimrc" "$HOME/.vimrc~"
    echo Creating backup of $HOME/.vimrc in $HOME/.vimrc~
fi

echo Creating / Overwriting $HOME/.vimrc
cp "$BASEDIR/.vimrc" "$HOME/.vimrc"
