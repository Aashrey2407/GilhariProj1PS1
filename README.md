# GilhariProj1PS1

Gilhari is a flexible microservice framework that simplifies exchanging of JSON data with relational databases.

This project involves configuring Gilhari microservice and running it using a Docker image, building a standalone project that generates 50 sample JSON objects to populate a database using Gilhari microservice framework, also using this framework to transfer the JSON data in and out of an RDBMS.

NOTE : This project is done on "macOS", if you are using any other operating system like "windows" some things might change, for example-

1. Windows: Uses "backslashes" ```\``` in file paths and drive letters.
   
   macOS: Uses "forward slashes" ```/``` in file paths and has a Unix-like file system starting from the root ```/```.

2. Windows: Has a wide range of GUI tools and editors, some of which may not be available on macOS. Tools like MySQL Workbench, Notepad
   ++, etc., are commonly used.
   
   macOS: Also has robust GUI tools, often with a focus on Unix compatibility and development, such as Sequel Pro for MySQL management, which might not be available on Windows.   

3. Windows: Batch files (.bat) are used for scripting. The syntax and commands differ significantly from Unix-like systems.
   
   macOS: Shell scripts (.sh) are used, and the terminal commands are similar to other Unix-based systems.


## INSTALLING MYSQL

Download and install MySQL from the [official MySQL website](https://dev.mysql.com/downloads/installer/). Follow the installation instructions provided for your operating system.

note: in this project MySql is used, if the reader wishes he/she can use any other RDBMS.


## GILHARI SETUP AND CONFIGURATION

First, make a project directory with the following sub-folders: ```config```, ```src```, ```libs```, ```bin```.

Gilhari and JDX are products of Software Tree, for more information please visit the company site mentioned below.
Download Gilhari SDK from the Software Tree Website: [Software Tree website](https://www.softwaretree.com/)

1. ```./config``` will contain files we acquired from Gilhari SDK downloaded, it also contains the jdbc driver jar file ```classnames_map_example.js``` which contains the class mapping. 
2. ```./libs``` will contain all the jar files we are going to use to compile the ```.java``` container class. 
3. Once the java file is compiled, ```.class``` file will be populated in the ```./bin folder```. 
4. ```src/org/emp``` contains the java file we are going to compile. 
5. The ```.jdx``` file in config specifies the database we will be using example, MySQL and the JDBC specs along with ORM mapping. 

We have copied many files from the SDK but since every system will have different requirements, update them accordingly. The```.config``` file contains the paths to the ORM spec file and the jdbc driver, it also mentions the path to the ```classnames_map_file```, ```db_username``` and ```password```. 

The ```.jdx``` file mentions the Database URL,JDBC driver path and the ORM mapping. When we compile we should make sure to include the following jar files in the classpath: 
1. ```jxclasses.jar```: All the classes that do the magic and are provided with the SDK.
2. ```json-202403030.jar```: This will allow us to import ```JSONException``` and ```JSONObject``` in our container class. 
3. JDBC Driver. 

Now, we can compile the java class in the terminal using the command: 
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


## CREATING DATABASE AND POPULATING IT

1. Open MySql client, enter the password when prompted, create a database by running the command: ```CREATE DATABASE jdxtestdb;```, the creation of database can be verified by running the command ```SHOW DATABASES;```, you should see ```jdxtestdb``` listed. 
2. Switch to the newly created database using the command ```USE jdxtestdb;```. This command sets ```jdxtestdb``` as the active database for subsequent operations.
3. To populate the database, see the ```populate.sh``` file.


## OBJECT MODEL

The foundation of our Gilhari project is the Employee object model. The essential characteristics and actions of an employee in our system are modeled by this model. The following characteristics are present in the Employee object:

1. ```id```: A unique identifier for each employee, which is an integer and serves as the primary key.
2. ```name```: The full name of the employee, represented as a string. This field is mandatory.
3. ```exempt```: A boolean attribute indicating whether the employee is exempt from overtime pay.
4. ```compensation```: The salary or hourly wage of the employee, represented as a decimal value.

These characteristics are necessary for our program to efficiently collect and handle employee data. Object-Relational Mapping (ORM) techniques are used to map the Employee object model to a relational database table, enabling smooth data manipulation and retrieval activities.


## AUTO INCREAMENT FEATURE

This project's Employee object model makes use of Gilhari's auto-increment capability to provide distinct ids for newly created Employee objects. This eliminates the need for manual assignment and guarantees that every employee has a distinct identity. When a new employee record is inserted, the auto-increment feature, which is specified in the database schema, enables the database to automatically assign the next available unique id.


## TECHNOLOGIES USED

1. ```GILHARI MICROSERVICE``` - Gilhari is a microservice framework to provide persistence for JSON objects in relational databases. This microservice framework, available in a Docker image, is configurable as per an app-specific object and relational models.

2. ```JDX``` - JDX is used for managing databases and automating tasks such as table creation and data population. It involves mapping between
object-oriented software models and relational databases.

3. ```POSTMAN``` - Postman is an API platform for building and using APIs. Postman simplifies each step of the API lifecycle and streamlines
collaboration so you can create better APIs—faster.

4. ```DOCKER``` - Docker is an application that lets you build, share, and run containerized applications and microservices. It provides a
straightforward GUI (Graphical User Interface) that lets you manage your containers, applications, and images directly from your machine.Docker Desktop reduces the time spent on complex setups so you can focus on writing code. It takes care of port mappings, file system concerns, and other default settings.

5. ```REST APIs``` - Gilhari exposes a REST (REpresentational State Transfer) interface to provide APIs (POST, GET, PUT, DELETE…) for CRUD  (Create, Retrieve, Update, and Delete) operations on the app-specific JSON objects.

6. ```GITHUB``` - GitHub is a developer platform that allows developers to create, store, manage and share their code. It uses Git software, 
providing the distributed version control of Git plus access control, bug tracking, software feature requests, task management, continuous integration, and wikis for every project.


