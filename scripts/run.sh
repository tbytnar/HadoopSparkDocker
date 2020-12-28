#set default worker container count if its unset
if [ -z "$1" ]
  then
    workerCount=1
  else
  	workerCount=$1
fi

echo "$workerCount worker and 1 master  container will be created..."

#add all worker containers name  to workers file
for (( i=1; i<=$workerCount; i++ ))
do
    echo "Exporting worker$i to workers file..."
    echo "worker$i" >> ./conf/workers
done

#Create a network named "hadoopNetwork"
docker network rm hadoopNetwork && docker network create -d bridge   --subnet 172.25.0.0/16  hadoopNetwork

#Create base hadoop image named "base-hadoop:1.0"
docker build -t base-hadoop:1.0 .

#run base-hadoop:1.0 image  as master container
docker run -itd  --network="hadoopNetwork"  --ip 172.25.0.100  -p 50070:50070  -p 8088:8088 --name master --hostname master  base-hadoop:1.0


for (( c=1; c<=$workerCount; c++ ))
do
    tmpName="worker$c"
    #run base-hadoop:1.0 image  as worker container
    docker run -itd  --network="hadoopNetwork"  --ip "172.25.0.10$c" --name $tmpName --hostname $tmpName  base-hadoop:1.0
done

#run hadoop commands
docker exec -ti master bash  -c "hadoop namenode -format && /usr/local/hadoop/sbin/start-dfs.sh && /usr/local/hadoop/sbin/start-yarn.sh"
docker exec -ti master bash
