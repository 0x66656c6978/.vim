#!/bin/sh
P_=`pwd`

echo Installing pathogen
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle 

echo Installing pathogen bundles from git repositories to $HOME/.vim/bundle
cd $HOME/.vim/bundle
cat "$P_"/.bundle-list | while read -r URL; do echo $URL; git clone $URL; done

if [ -f $HOME/.vimrc ] ; then
    mv $HOME/.vimrc $HOME/.vimrc~
    echo Creating backup of $HOME/.vimrc in $HOME/.vimrc~
fi

echo Creating / Overwriting $HOME/.vimrc
cd "$P_"
cp .vimrc $HOME/.vimrc


echo 'source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"' >> ~/.bashrc
