hive -f ./create_test_db.sql

hdfs dfs -put ./data/geolocation.csv /user/hive/warehouse/test/geolocation/
hdfs dfs -put ./data/trucks.csv /user/hive/warehouse/test/trucks/

hive -e "select CONCAT('Total Geolocations = ',CAST(COUNT(*) as STRING)) FROM test.geolocation;"
hive -e "select CONCAT('Total Trucks = ',CAST(COUNT(*) as STRING)) FROM test.trucks;"