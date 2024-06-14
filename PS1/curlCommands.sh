#!/bin/sh
# A shell script to invoke some sample curl commands on a Linux machine 
# against a running container image of the app-specific Gilhari microservice 
# gilhari_simple_example:1.0
# 
# The responses are recorded in a log file (curl.log).
#
# Note that these curl commands use a mapped port number of 80
# even though the port number exposed by the app-specific 
# microservice may be different (e.g., 8081) inside the container shell.
# If you want to use these curl commands from inside the
# container shell on the host machine, you may have to use
# the exposed port number (e.g., 8081) instead.

echo -e "** BEGIN OUTPUT **" > curl.log

echo "** Delete all Employee objects to start fresh" >> curl.log
curl -X DELETE "http://localhost:80/gilhari/v1/Employee" >> curl.log
echo "" >> curl.log

echo -e "** Insert one Employee object \n" >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee"  -H 'Content-Type: application/json' -d '{"entity":{"id":39,"name":"John39","compensation":54039,"exempt":true,"DOB":381484800390}}' >> curl.log
echo -e "" >> curl.log

echo "** Query all Employee objects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Employee"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** Insert multiple (two) Employee objects" >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee"  -H 'Content-Type: application/json' -d '{"entity":[{"id":40,"name":"Mike40","compensation":54040,"exempt":false,"DOB":381484800400}, {"id":41,"name":"Mary41","compensation":54041,"exempt":true,"DOB":381484800410}]}' >> curl.log
echo "" >> curl.log

echo "** Query all Employee objects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Employee"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** Query non-exempted Employee objects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Employee?filter=exempt=0"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** Query the count of exempted Employee objects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Employee/getAggregate?attribute=id&aggregateType=COUNT&filter=exempt=1"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** Delete all exempted Employee objects" >> curl.log
curl -X DELETE "http://localhost:80/gilhari/v1/Employee?filter=exempt=1" >> curl.log
echo "" >> curl.log

echo "** Query the count of all exempted Employee objects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Employee/getAggregate?attribute=id&aggregateType=COUNT&filter=exempt=1"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

# echo "** Delete all Employee objects" >> curl.log
# curl -X DELETE "http://localhost:80/gilhari/v1/Employee" >> curl.log
# echo "" >> curl.log

echo "** Query the count of all Employee objects" >> curl.log
curl -X GET   "http://localhost:80/gilhari/v1/Employee/getAggregate?attribute=id&aggregateType=COUNT"  -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

echo "** END OUTPUT **" >> curl.log
echo "" >> curl.log

cat curl.log
