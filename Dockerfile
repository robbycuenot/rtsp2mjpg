FROM ubuntu:latest

# Install VLC and other dependencies
RUN apt-get update && apt-get install -y vlc

# Create a non-root user for running VLC
RUN useradd -ms /bin/bash vlc

# Copy the VLC script to the container
COPY stream.sh /

# Make the VLC script executable
RUN chmod +x /stream.sh

# Set the default user and command to run the VLC script
USER vlc
CMD ["/stream.sh"]
