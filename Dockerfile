# Use the Eclipse Temurin JDK 17 base image with Alpine for a lightweight container
FROM eclipse-temurin:17-jdk-alpine

# Set environment variable for the application home directory
ENV APP_HOME /usr/src/app

# Create the application directory in the container
RUN mkdir -p $APP_HOME

# Expose port 8080 for the application
EXPOSE 8080

# Copy the built JAR file from the local target directory to the container
COPY target/*.jar $APP_HOME/app.jar

# Set the working directory to APP_HOME
WORKDIR $APP_HOME

# Command to run the application using the Java JAR file
CMD ["java", "-jar", "app.jar"]
