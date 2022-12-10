FROM ubuntu:latest

# Install VLC and other dependencies
RUN apt-get update && apt-get install -y vlc

# Copy the VLC script to the container
COPY vlc-script.sh /

# Make the VLC script executable
RUN chmod +x /vlc-script.sh

# Set the default command to run the VLC script
CMD ["/vlc-script.sh"]
