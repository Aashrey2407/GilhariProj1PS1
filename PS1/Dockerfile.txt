# Use the base image with gilhari already installed
FROM dperiwal/st_repo:gilhari

# Set the working directory inside the container
WORKDIR /opt/gilhari_simple_example

# Add necessary files and directories to the container
ADD bin ./bin
ADD config ./config
ADD gilhari_service.config .

# Expose port 8081 (assuming your application listens on this port)
EXPOSE 8081

# Specify the command to run when the container starts
CMD ["node", "/node/node_modules/gilhari_rest_server/gilhari_rest_server.js", "gilhari_service.config"]
