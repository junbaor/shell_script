apt update
apt install gcc make ruby
gem install redis

wget http://download.redis.io/releases/redis-4.0.1.tar.gz
tar zxvf redis-4.0.1.tar.gz
cd redis-4.0.1

make
cd ..

mkdir cluster-test && cd cluster-test
mkdir 7000 7001 7002 7003 7004 7005

cp ../redis-4.0.1/src/redis-cli ./
cp ../redis-4.0.1/src/redis-trib.rb ./

cp ../redis-4.0.1/src/redis-server 7000
cp ../redis-4.0.1/src/redis-server 7001
cp ../redis-4.0.1/src/redis-server 7002
cp ../redis-4.0.1/src/redis-server 7003
cp ../redis-4.0.1/src/redis-server 7004
cp ../redis-4.0.1/src/redis-server 7005

cat > 7000/redis.conf  <<EOF
port 7000
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
daemonize yes
protected-mode no
EOF

cat  > 7001/redis.conf  <<EOF
port 7001
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
daemonize yes
protected-mode no
EOF

cat  > 7002/redis.conf  <<EOF
port 7002
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
daemonize yes
protected-mode no
EOF

cat  > 7003/redis.conf  <<EOF
port 7003
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
daemonize yes
protected-mode no
EOF

cat  > 7004/redis.conf  <<EOF
port 7004
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
daemonize yes
protected-mode no
EOF

cat  > 7005/redis.conf  <<EOF
port 7005
cluster-enabled yes
cluster-config-file nodes.conf
cluster-node-timeout 5000
daemonize yes
protected-mode no
EOF

cat > start-all.sh <<EOF
cd 7000
./redis-server redis.conf
cd ../7001
./redis-server redis.conf
cd ../7002
./redis-server redis.conf
cd ../7003
./redis-server redis.conf
cd ../7004
./redis-server redis.conf
cd ../7005
./redis-server redis.conf
EOF

chmod 755 start-all.sh
./start-all.sh

./redis-trib.rb create --replicas 1 127.0.0.1:7000 127.0.0.1:7001 \
127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005
