FROM ubuntu:latest

# Install VLC and other dependencies
RUN apt-get update && apt-get install -y vlc

# Copy the VLC script to the container
COPY stream.sh /

# Make the VLC script executable
RUN chmod +x /stream.sh

# Set the default command to run the VLC script
CMD ["/stream.sh"]
