# GilhariProj1PS1

This project involves configuring Gilhari microservice and running it using a Docker image, building a standalone project that generates 50 sample JSON objects to populate a database using Gilhari microservice framework, also using this framework to transfer the JSON data in and out of an RDBMS.


## INSTALLING MYSQL

Download and install MySQL from the [official MySQL website](https://dev.mysql.com/downloads/installer/). Follow the installation instructions provided for your operating system.

note: in this project MySql is used, if the reader wishes he/she can use RDBMS.

## GILHARI SETUP AND CONFIGURATION

First, make a project directory with the following sub-folders: ```config```, ```src```, ```libs```, ```bin```.


Download Gilhari SDK from the Software Tree Website: [Software Tree website](https://www.softwaretree.com/)
```./config``` will contain files we acquired from Gilhari SDK downloaded. ```./libs``` will contain all the jar files we are going to use to compile the ```.java``` container class. Once the java file is compiled, ```.class``` file will be populated in the ```./bin folder```. ```src/org/emp``` contains the java file we are going to compile. Config directory contains ```classnames_map_example.js``` which contains the class mapping. The ```.jdx``` file in config specifies the database we will be using example, MySQL and the JDBC specs along with ORM mapping. Config also contains the jdbc driver jar file.

We have copied many files from the SDK but since every system will have different requirements, update them accordingly. The```.config``` file contains the paths to the ORM spec file and the jdbc driver. It also mentions the path to the ```classnames_map_file```, ```db_username``` and ```password```. The ```.jdx``` file mentions the Database URL,JDBC driver path and the ORM mapping. When we compile we should make sure to include the following jar files in the classpath: ```jxclasses.jar```: All the classes that do the magic and are provided with the SDK; ```json-202403030.jar```: This will allow us to import ```JSONException``` and ```JSONObject``` in our container class; JDBC Driver. Now, we can compile the java class in the terminal using the command: 
```javac -cp config/mysql-connector-j-8.3.0.jar:libs/jxclasses.jar:libs/json-20240303.jar -d bin src/org/emp/JSON_Employee.java```
Since we have mentioned the destinations(using -d tag) as the bin folder, we will get the ```.class``` file in the bin folder.

Gilhari will be listening on the port number 8081.
After creating the text file, next step will be to build the docker image on the terminal using the command: 
```docker build -t my_app_gilhari12 -f ./Dockerfile .```

Then we will run the image using:
Run the docker image using: 
```docker run -p 80:8081 --platform linux/amd64 my_app_gilhari12```

## SUMMARY

1. Update and modify files according to system requirements.
2. Compile the container class.
3. Make the docker image and run it.


## CREATING DATABASE 

Open MySql client, enter the password when prompted, create a database by running the command: ```CREATE DATABASE jdxtestdb;```, the creation of database can be verified by running the command ```SHOW DATABASES;```, You should see ```jdxtestdb``` listed. Switch to the newly created database using the command ```USE jdxtestdb;```. This command sets ```jdxtestdb``` as the active database for subsequent operations.



