source /vagrant/scripts/.env
export NUM_NODES=$1
export CURRENT_NODE=$2

sudo perl -p -i -e 's/^127\.0\.1\.1.*$//g' /etc/hosts

for ((i=1; i<=NUM_NODES; i++)); 
do
    sudo -- /bin/sh -c "echo '192.168.34.$((${i} + 100)) kafka-node-${i}' >> /etc/hosts"
done