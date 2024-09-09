 # Use the official Ubuntu base image
FROM ubuntu:20.04

# Set environment variables to non-interactive to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y \
        openjdk-11-jdk \
        git \
        wget \
        gnupg \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add the Jenkins repository and install Jenkins
RUN curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get install -y jenkins && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose the port Jenkins runs on
EXPOSE 8080

# Define the default command to run Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]

