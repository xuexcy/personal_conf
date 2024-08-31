#!/bin/bash

cp ./vimrc ~/.vimrc

mkdir -p ~/.bashrc_personal
cp -r bashrc_personal/* ~/.bashrc_personal

echo_to_rc() {
    path=$1
    if ! grep -q "bashrc_personal" "$path"; then
        echo "source ~/.bashrc_personal/run.sh" >> $path
    fi
}
echo_to_rc ~/.bashrc
echo_to_rc ~/.zshrc
