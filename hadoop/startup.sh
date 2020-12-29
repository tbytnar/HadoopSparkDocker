# HDFS Setup
hdfs dfs -mkdir /tmp
hdfs dfs -chmod g+w /tmp

hdfs dfs -mkdir -p /user/hive/warehouse/geolocation
hdfs dfs -chmod g+w /user/hive/warehouse

# PostgreSQL install and configure
apt -y install postgresql libpostgresql-jdbc-java sudo
service postgresql start
sudo -u postgres psql -c "CREATE USER hiveuser WITH PASSWORD 'mypassword';"
sudo -u postgres psql -c "CREATE DATABASE metastore_db;"




# Fix guava dependency and initialize Derby Database
rm $HIVE_HOME/lib/guava-19.0.jar
cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib/

$HIVE_HOME/bin/schematool -dbType postgres -initSchema 