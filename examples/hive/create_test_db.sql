CREATE SCHEMA IF NOT EXISTS test;

CREATE EXTERNAL TABLE IF NOT EXISTS test.geolocation
(truckid INT,driverid INT,event STRING,latitude STRING,longitude STRING,city STRING,state STRING,velocity INT,event_ind INT,idling_ind INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs://hadoopmaster:9000/user/hive/warehouse/test/geolocation';

CREATE EXTERNAL TABLE IF NOT EXISTS test.trucks
(driverid INT,truckid INT,model STRING,jun13_miles INT,jun13_gas INT,may13_miles INT,may13_gas INT,apr13_miles INT,apr13_gas INT,mar13_miles INT,mar13_gas INT,feb13_miles INT,feb13_gas INT,jan13_miles INT,jan13_gas INT,dec12_miles INT,dec12_gas INT,nov12_miles INT,nov12_gas INT,oct12_miles INT,oct12_gas INT,sep12_miles INT,sep12_gas INT,aug12_miles INT,aug12_gas INT,jul12_miles INT,jul12_gas INT,jun12_miles INT,jun12_gas INT,may12_miles INT,may12_gas INT,apr12_miles INT,apr12_gas INT,mar12_miles INT,mar12_gas INT,feb12_miles INT,feb12_gas INT,jan12_miles INT,jan12_gas INT,dec11_miles INT,dec11_gas INT,nov11_miles INT,nov11_gas INT,oct11_miles INT,oct11_gas INT,sep11_miles INT,sep11_gas INT,aug11_miles INT,aug11_gas INT,jul11_miles INT,jul11_gas INT,jun11_miles INT,jun11_gas INT,may11_miles INT,may11_gas INT,apr11_miles INT,apr11_gas INT,mar11_miles INT,mar11_gas INT,feb11_miles INT,feb11_gas INT,jan11_miles INT,jan11_gas INT,dec10_miles INT,dec10_gas INT,nov10_miles INT,nov10_gas INT,oct10_miles INT,oct10_gas INT,sep10_miles INT,sep10_gas INT,aug10_miles INT,aug10_gas INT,jul10_miles INT,jul10_gas INT,jun10_miles INT,jun10_gas INT,may10_miles INT,may10_gas INT,apr10_miles INT,apr10_gas INT,mar10_miles INT,mar10_gas INT,feb10_miles INT,feb10_gas INT,jan10_miles INT,jan10_gas INT,dec09_miles INT,dec09_gas INT,nov09_miles INT,nov09_gas INT,oct09_miles INT,oct09_gas INT,sep09_miles INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'hdfs://hadoopmaster:9000/user/hive/warehouse/test/trucks';

