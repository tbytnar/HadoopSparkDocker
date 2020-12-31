# HadoopSparkDocker
Getting your feet wet with Hadoop can prove challenging without getting an accidental invoice from a cloud provider.  This repository aims to fix that.

## What this environment is
The goal of this environment is provide a barebones installation of the most commonly used critical components of a clustered Hadoop environment for training or development purposes.

## What this environment isnt
This environment has NOT been developed with security standards and best practices in mind.  It has also not been optimized for performance.  There for by no means should you ever consider deploying it for production purposes.


## How to use this environment
Clone this repository to your machine.

From Windows Powershell (run as administrator) or a Linux/Mac terminal:
- Change directories to the cloned repository location
- For Hadoop execute the following:
    - docker-compose -f spark-compose.yaml up -d
- For Spark execute the following:
    - docker-compose -f hadoop-compose.yaml up -d
-To connect to the shell within the environments and start working:
    - For HDFS or Hive:
        - docker exec -it hadoopmaster /bin/bash
    - For Spark:
        - docker exec -it sparkmaster /bin/bash

To shutdown the environments:
- docker-compose -f spark-compose.yaml down
- docker-compose -f hadoop-compose.yaml down


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
    - Hive 3.1.2
    - PostgreSQL - Hive Metastore Database
- hadoopworker1 - Depends on WorkerCount argument in run scripts
    - Hadoop 3.3.0
    - YARN
- hadoopworker2 - Depends on WorkerCount argument in run scripts
    - Hadoop 3.3.0
    - YARN
- sparkmaster 
    - Scala 2.12.10
    - Spark 3.0.1
- sparksubmit
    - Scala 2.12.10
    - Spark 3.0.1
- sparkworker1 
    - Scala 2.12.10
    - Spark 3.0.1
- sparkworker2
    - Scala 2.12.10
    - Spark 3.0.1
