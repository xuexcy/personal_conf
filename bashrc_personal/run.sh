CUR_DIR=$(cd `dirname $0`; pwd)

source ${CUR_DIR}/bashrc
source ${CUR_DIR}/alias.sh
source ${CUR_DIR}/functions.sh

if [ -e ~/.bashrc_local ]
then
    source ~/.bashrc_local
fi
