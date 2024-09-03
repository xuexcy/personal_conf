#!/bin/bash
CUR_DIR=$(cd `dirname $0`; pwd)

mv ~/.vimrc ~/.vimrc.bak.`date '+%Y%m%d_%H%M%S'`
ln -s ${CUR_DIR}/vimrc ~/.vimrc 

rm -rf ~/.bashrc_personal
ln -s ${CUR_DIR}/bashrc_personal ~/.bashrc_personal

echo_to_rc() {
    path=$1
    if ! grep -q "bashrc_personal" "$path"; then
        echo "source ~/.bashrc_personal/run.sh" >> $path
    fi
}
echo_to_rc ~/.bashrc
echo_to_rc ~/.zshrc
