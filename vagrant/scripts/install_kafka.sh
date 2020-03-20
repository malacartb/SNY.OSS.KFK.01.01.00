source /vagrant/scripts/.env
curl https://mirror.nohup.it/apache/kafka/2.4.1/kafka_2.13-2.4.1.tgz -o /home/vagrant/kafka_2.13-2.4.1.tgz
mkdir -p $KAFKA_HOME/logs
tar xfz /home/vagrant/kafka_*.tgz --strip 1 -C $KAFKA_HOME
sudo chown -R vagrant:vagrant $KAFKA_HOME
echo "export KAFKA_HOME=$KAFKA_HOME" >> /home/vagrant/.profile
echo "export PATH=\$PATH:\$KAFKA_HOME/bin" >> /home/vagrant/.profile



