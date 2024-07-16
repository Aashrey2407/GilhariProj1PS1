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

curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Aashrey","compensation":1000000,"exempt":true,"DOB":1059004800000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Jane Doe","compensation":75000,"exempt":false,"DOB":632448000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"John Smith","compensation":82000,"exempt":true,"DOB":631152000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Alice Johnson","compensation":95000,"exempt":false,"DOB":693792000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Bob Brown","compensation":105000,"exempt":true,"DOB":662688000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Charlie Davis","compensation":120000,"exempt":true,"DOB":694224000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Dana Lee","compensation":78000,"exempt":false,"DOB":725328000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Evan White","compensation":98000,"exempt":true,"DOB":756432000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Fiona Green","compensation":85000,"exempt":false,"DOB":787536000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"George Black","compensation":100000,"exempt":true,"DOB":818640000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Hannah Blue","compensation":90000,"exempt":false,"DOB":849744000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Ian Gray","compensation":95000,"exempt":true,"DOB":880848000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Jack Hill","compensation":110000,"exempt":false,"DOB":911952000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Kara Moore","compensation":72000,"exempt":true,"DOB":943056000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Liam Scott","compensation":84000,"exempt":false,"DOB":974160000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Mia Wright","compensation":91000,"exempt":true,"DOB":1005264000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Noah Turner","compensation":88000,"exempt":false,"DOB":1036800000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Olivia Parker","compensation":102000,"exempt":true,"DOB":1068336000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Paul Martinez","compensation":95000,"exempt":false,"DOB":1099872000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Quinn Evans","compensation":87000,"exempt":true,"DOB":1131408000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Riley Collins","compensation":94000,"exempt":false,"DOB":1162944000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Sam Bailey","compensation":98000,"exempt":true,"DOB":1194480000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Tina Adams","compensation":85000,"exempt":false,"DOB":1226016000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Uma Kelly","compensation":90000,"exempt":true,"DOB":1257552000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Vince Sanders","compensation":95000,"exempt":false,"DOB":1289088000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Wendy Ramirez","compensation":100000,"exempt":true,"DOB":1320624000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Xander Perez","compensation":110000,"exempt":false,"DOB":1352160000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Yara Bennett","compensation":92000,"exempt":true,"DOB":1383696000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Zane King","compensation":87000,"exempt":false,"DOB":1415232000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Abby Carter","compensation":93000,"exempt":true,"DOB":1446768000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Brian Young","compensation":89000,"exempt":false,"DOB":1478304000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Cara Foster","compensation":105000,"exempt":true,"DOB":1509840000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"David Murphy","compensation":91000,"exempt":false,"DOB":1541376000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Ella Ward","compensation":97000,"exempt":true,"DOB":1572912000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Frank Walker","compensation":88000,"exempt":false,"DOB":1604448000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Grace Lewis","compensation":94000,"exempt":true,"DOB":1635984000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Henry Clark","compensation":93000,"exempt":false,"DOB":1667520000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Isla Allen","compensation":92000,"exempt":true,"DOB":1699056000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Jackie Hall","compensation":91000,"exempt":false,"DOB":1730592000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Kevin Scott","compensation":90000,"exempt":true,"DOB":1762128000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Laura Green","compensation":95000,"exempt":false,"DOB":1793664000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Mark Adams","compensation":97000,"exempt":true,"DOB":1825200000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Nina Moore","compensation":93000,"exempt":false,"DOB":1856736000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Oscar King","compensation":91000,"exempt":true,"DOB":1888272000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Paula Perez","compensation":97000,"exempt":false,"DOB":1919808000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Quincy Bennett","compensation":94000,"exempt":true,"DOB":1951344000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Rachel Carter","compensation":92000,"exempt":false,"DOB":1982880000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Steven Young","compensation":95000,"exempt":true,"DOB":2014416000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Tara Foster","compensation":100000,"exempt":false,"DOB":2045952000000}}' >> curl.log
curl -X POST "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' -d '{"entity":{"name":"Ulysses Murphy","compensation":105000,"exempt":true,"DOB":2077488000000}}' >> curl.log


echo "** Query all Employee objects" >> curl.log
curl -X GET "http://localhost:80/gilhari/v1/Employee" -H 'Content-Type: application/json' >> curl.log
echo "" >> curl.log

cat curl.log

