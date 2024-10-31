#!/bin/bash
CUR_DIR=$(cd `dirname $0`; pwd)

from=${CUR_DIR}/vim/vimrc
to=~/.vimrc
mv $to ${to}.bak.`date '+%Y%m%d_%H%M%S'`
ln -s $from $to

from=${CUR_DIR}/bashrc_personal
to=~/.bashrc_personal
rm -rf $to
ln -s $from $to

from=${CUR_DIR}/vim/xuechengyun_file_template
to=~/.vim/xuechengyun_file_template
rm -rf $to
ln -s $from $to

echo_to_rc() {
    path=$1
    if ! grep -q "bashrc_personal" "$path"; then
        echo "source ~/.bashrc_personal/run.sh" >> $path
    fi
}
echo_to_rc ~/.bashrc
echo_to_rc ~/.zshrc
