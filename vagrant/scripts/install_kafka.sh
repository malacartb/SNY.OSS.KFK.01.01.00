curl https://mirror.nohup.it/apache/kafka/2.4.1/kafka_2.13-2.4.1.tgz -o /home/vagrant/kafka_2.13-2.4.1.tgz
mkdir -p /home/vagrant/kafka/logs
tar xfz /home/vagrant/kafka_*.tgz --strip 1 -C /home/vagrant/kafka 
sudo chown -R vagrant:vagrant /home/vagrant
echo "export KAFKA_HOME=/home/vagrant/kafka" >> /home/vagrant/.profile
echo "export PATH=\$PATH:\$KAFKA_HOME/bin" >> /home/vagrant/.profile



