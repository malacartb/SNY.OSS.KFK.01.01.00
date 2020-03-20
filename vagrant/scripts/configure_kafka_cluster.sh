source /vagrant/scripts/.env
export NUM_NODES=$1
export CURRENT_NODE=$2
export ZOOKEEPER_CLUSTER_ADDRESS_LIST=""

if [ ! -f $KAFKA_HOME/config/server.properties.orig ]; then
    cp $KAFKA_HOME/config/server.properties $KAFKA_HOME/config/server.properties.orig
fi


for ((i=1; i<=NUM_NODES; i++)); 
do
    if [ ! -z "$ZOOKEEPER_CLUSTER_ADDRESS_LIST" ];
    then
        ZOOKEEPER_CLUSTER_ADDRESS_LIST="$ZOOKEEPER_CLUSTER_ADDRESS_LIST,"
    fi
    ZOOKEEPER_CLUSTER_ADDRESS_LIST=${ZOOKEEPER_CLUSTER_ADDRESS_LIST}kafka-node-$i:2181
done

perl -p -i -e "s/broker\.id=0/broker\.id=$CURRENT_NODE/g" $KAFKA_HOME/config/server.properties
perl -p -i -e "s/log\.dirs=\/tmp\/kafka-logs/log\.dirs=\/home\/vagrant\/kafka\/logs/g" $KAFKA_HOME/config/server.properties
perl -p -i -e "s/zookeeper\.connect=localhost:2181/zookeeper\.connect=$ZOOKEEPER_CLUSTER_ADDRESS_LIST/g" $KAFKA_HOME/config/server.properties
perl -p -i -e "s/#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/$(hostname):9092/g" $KAFKA_HOME/config/server.properties