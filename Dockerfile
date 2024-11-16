# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install prerequisites
RUN apt-get update && \
    apt-get install -y python3-full python3-pip python3-venv git pipx && \
    apt-get clean

# Create the config directory structure
RUN mkdir -p /root/.config/exponent

# Install Exponent CLI using pipx (which is now installed via apt)
RUN pipx install exponent-run

# Add pipx binary location to PATH
ENV PATH="/root/.local/bin:$PATH"

# Set the working directory
WORKDIR /app

# Command to run Exponent
CMD ["exponent-run"]