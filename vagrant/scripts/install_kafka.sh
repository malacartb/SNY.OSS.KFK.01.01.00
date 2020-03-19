curl https://mirror.nohup.it/apache/kafka/2.4.1/kafka_2.13-2.4.1.tgz -o /home/vagrant/kafka_2.13-2.4.1.tgz
mkdir -p /home/vagrant/kafka/logs
tar xfz /home/vagrant/kafka_*.tgz --strip 1 -C /home/vagrant/kafka 
sudo chown -R vagrant:vagrant /home/vagrant
echo "export PATH=\$PATH:/home/vagrant/kafka/bin" > /home/vagrant/.bash_profile


sudo cp /vagrant/resources/zookeeper.service /etc/systemd/system/zookeeper.service
sudo cp /vagrant/resources/kafka.service /etc/systemd/system/kafka.service

sudo systemctl enable kafka
sudo systemctl start kafka
