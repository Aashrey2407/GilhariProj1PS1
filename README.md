# GilhariProj1PS1
Demonstrating the use of Gilhari to transfer 50 JSON objects to any RDBMS 
# Few simple steps to install and configure Gilhari
1. Compile the Java container class and store the .class file in bin folder using this command: javac -cp config/mysql-connector-j-8.3.0.jar:libs/jxclasses.jar:libs/json-20240303.jar -d bin src/org/emp/JSON_Employee.java
2. We are using MySQL for our project, so update the .jdx and .config file accordingly.
3. Create a Dockerfile that downloads base Gilhari image and imposes app-specific requirements on it.
4. Build the docker image using the command: docker build -t my_app_gilhari12 -f ./Dockerfile .      
5. Run the docker image using: docker run -p 80:8081 --platform linux/amd64 my_app_gilhari12.
You’re good to go! It’s that simple.
