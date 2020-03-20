source /vagrant/scripts/.env
export NUM_NODES=$1
export CURRENT_NODE=$2
export ZOOKEEPER_CLUSTER_ADDRESS_LIST=""

if [ ! -f $KAFKA_HOME/config/zookeeper.properties.orig ]; then
    cp $KAFKA_HOME/config/zookeeper.properties $KAFKA_HOME/config/zookeeper.properties.orig
fi

mkdir -p /var/lib/zookeeper
chown -R vagrant:vagrant /var/lib/zookeeper
echo "$CURRENT_NODE" > /var/lib/zookeeper/myid
cp /vagrant/resources/zookeeper.properties $KAFKA_HOME/config/zookeeper.properties

for ((i=1; i<=NUM_NODES; i++)); 
do
    echo "server.${i}=kafka-node-$i:2888:3888" >> $KAFKA_HOME/config/zookeeper.properties
done

echo "$ZOOKEEPER_CLUSTER_ADDRESS_LIST" >> $KAFKA_HOME/config/zookeeper.properties
