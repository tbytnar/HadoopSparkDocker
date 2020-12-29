#Java
echo "
#Java Home directory configuration
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
export PATH="$PATH:$JAVA_HOME/bin"
" >> /root/.bashrc

#Hadoop and YARN
echo "
# Hadoop home directory configuration
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
" >> /root/.bashrc

echo "
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/
" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh

#Hive
echo "
export HIVE_HOME=/usr/local/hive
export PATH=$PATH:$HIVE_HOME/bin
" >> /root/.bashrc

echo "
export HADOOP_HOME=/usr/local/hadoop
" >> /usr/local/hive/bin/hive-config.sh
