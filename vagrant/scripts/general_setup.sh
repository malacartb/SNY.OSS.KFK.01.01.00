source /vagrant/scripts/.env
export NUM_NODES=$1
export CURRENT_NODE=$2

sudo timedatectl set-timezone $TIMEZONE