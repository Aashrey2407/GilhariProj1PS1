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

echo "** BEGIN OUTPUT **" > curl.log

echo "** Delete all Employee objects to start fresh" >> curl.log
curl -X DELETE "http://localhost:80/gilhari/v1/Employee" >> curl.log
echo "" >> curl.log

for i in $(seq 1 50)
do
  # Create a unique ID, name, compensation, and DOB
  ID=$i
  NAME="John$ID"
  COMPENSATION=$((54000 + i))
  DOB=$((381484800000 + i))

  # Add the curl command to the log file and execute it
  echo "** Inserting Employee $ID" >> curl.log
  curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d "{\"entity\":{\"id\":$ID,\"name\":\"$NAME\",\"compensation\":$COMPENSATION,\"exempt\":true,\"DOB\":$DOB}}" >> curl.log
  echo "" >> curl.log
done

echo "** Completed inserting Employees" >> curl.log
echo "" >> curl.log

echo "** Query all Employee objects" >> curl.log
curl -X GET "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

cat curl.log
