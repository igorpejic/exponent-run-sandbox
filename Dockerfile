# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install prerequisites
RUN apt-get update && \
    apt-get install -y python3-full python3-pip python3-venv git pipx && \
    apt-get clean

# Create or reuse ubuntu user with specified UID and GID
ARG USER_ID=1000
ARG GROUP_ID=1000
RUN groupadd -f -g ${GROUP_ID} ubuntu && \
    id -u ubuntu &>/dev/null || useradd -m -u ${USER_ID} -g ubuntu -s /bin/bash ubuntu

# Create virtual environment and activate it
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"


# Create the config directory structure
RUN mkdir -p /root/.config/exponent

# Install packages in virtual environment
RUN pip install --no-cache-dir exponent-run

# Set the working directory
WORKDIR /app

# Command to run Exponent
CMD ["exponent-run"]
