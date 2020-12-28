param(
    [Parameter()]
    [string]$WorkerCount
)
if ($null -eq $WorkerCount -or 0 -eq $WorkerCount)
{
    $WorkerCount = 1    
}

write-host "$WorkerCount datanodes and 1 namenode will be created..."

# Create workers file
Remove-Item -Path ./hadoop/conf/workers
for (($i=1); ($i -le $WorkerCount); ($i++))
{
    $tmpName = "worker$i"
    write-host "Exporting $tmpName to workers file..."
    Add-Content -Path ./hadoop/conf/workers -Value ($tmpName)
    docker run -itd  --network="hadoopNetwork"  --ip "172.25.0.10$i" --name $tmpName --hostname $tmpName  base-hadoop:1.0
}

#Create base hadoop image named "base-hadoop:1.0"
docker build -t base-hadoop:1.0 ./hadoop/

#Create a network named "hadoopNetwork"
docker network rm hadoopNetwork 
docker network create -d bridge --subnet 172.25.0.0/16  hadoopNetwork

# Create master container
docker run -itd  --network="hadoopNetwork"  --ip 172.25.0.100  -p 50070:50070  -p 8088:8088 --name master --hostname master  base-hadoop:1.0

# Create all worker containers
for (($i=1); ($i -le $WorkerCount); ($i++))
{
    $tmpName = "worker$i"
    docker run -itd  --network="hadoopNetwork"  --ip "172.25.0.10$i" --name $tmpName --hostname $tmpName  base-hadoop:1.0
}

#run hadoop commands
docker exec -ti master bash  -c "hadoop namenode -format && /usr/local/hadoop/sbin/start-dfs.sh && /usr/local/hadoop/sbin/start-yarn.sh"
docker exec -ti master bash