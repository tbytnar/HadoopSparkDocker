# HadoopSparkDocker

## Environment details
Built With:
- Windows 10 Profesional
- Visual Studio Code
- Docker For Windows (WSL2) v20.10.0
- Ubuntu 20.04.1. LTS (WSL2)

Containers:
- hadoopmaster
    - Hadoop 3.3.0
    - YARN
    - Hive
- hadoopworker[n] - Depends on WorkerCount argument in run scripts
    - Hadoop 3.3.0

## How to use this environment
Clone this repository to your machine.

On Windows:
- Launch Powershell as Administrator
- Execute scripts/run.ps1 like so:
    - ./run.ps1 -WorkerCount 2 
    - This will provision the hadoop environment with 1 master node and 2 worker nodes
    - Docker will automatically attach a console to the hadoopmaster container
- Explore the /examples/ directory for some sample work

On Linux/Mac:
- Launch terminal
- Execute scripts/run.sh like so:
    - ./run.sh 2 
    - This will provision the hadoop environment with 1 master node and 2 worker nodes
    - Docker will automatically attach a console to the hadoopmaster container
- Explore the /examples/ directory for some sample work