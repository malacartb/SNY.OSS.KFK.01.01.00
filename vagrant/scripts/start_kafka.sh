sudo cp /vagrant/resources/zookeeper.service /etc/systemd/system/zookeeper.service
sudo cp /vagrant/resources/kafka.service /etc/systemd/system/kafka.service

sudo systemctl enable kafka
sudo systemctl start kafka