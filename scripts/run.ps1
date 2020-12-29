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
Remove-Item -Path ../hadoop/conf/workers -ErrorAction SilentlyContinue
for (($i=1); ($i -le $WorkerCount); ($i++))
{
    $tmpName = "hadoopworker$i"
    write-host "Exporting $tmpName to workers file..."
    Add-Content -Path ../hadoop/conf/workers -Value ($tmpName)
    docker run -itd  --network="hadoopNetwork"  --ip "172.25.0.10$i" --name $tmpName --hostname $tmpName  base-hadoop:1.0
}

#Create base hadoop image named "base-hadoop:1.0"
docker build -t base-hadoop:1.0 ../hadoop/

#Create a network named "hadoopNetwork"
docker network rm hadoopNetwork 
docker network create -d bridge --subnet 172.25.0.0/16  hadoopNetwork

# Create master container
#docker run -itd -v c:\docker_files:/hostfiles --network="hadoopNetwork" --ip 172.25.0.100  -p 9870:9870  -p 8088:8088 --name hadoopmaster --hostname hadoopmaster base-hadoop:1.0 
docker run -itd --network="hadoopNetwork" --ip 172.25.0.100  -p 9870:9870  -p 8088:8088 --name hadoopmaster --hostname hadoopmaster base-hadoop:1.0 

# Create all worker containers
for (($i=1); ($i -le $WorkerCount); ($i++))
{
    $tmpName = "hadoopworker$i"
    docker run -itd  --network="hadoopNetwork"  --ip "172.25.0.10$i" --name $tmpName --hostname $tmpName  base-hadoop:1.0
}

#run hadoop commands
docker exec -ti hadoopmaster bash  -c "hadoop namenode -format && /usr/local/hadoop/sbin/start-dfs.sh && /usr/local/hadoop/sbin/start-yarn.sh"
docker exec -ti hadoopmaster bash -c "./root/startup.sh"
docker exec -ti hadoopmaster bash