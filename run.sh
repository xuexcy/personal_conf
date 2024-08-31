#!/bin/bash

cp ./vimrc ~/.vimrc

mkdir -p ~/.bashrc_personal
cp -r bashrc_personal/* ~/.bashrc_personal
echo "source ~/.bashrc_personal/run.sh" >> ~/.bashrc
echo "source ~/.bashrc_personal/run.sh" >> ~/.zshrc
