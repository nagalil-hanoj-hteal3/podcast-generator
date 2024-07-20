FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git \
  build-essential

# Check Python and pip installation
RUN python3 --version && pip3 --version

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install PyYAML with detailed output for debugging
RUN pip3 install PyYAML --verbose

# Copy files and check if they exist
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Debugging: list the files in /usr/bin and root to ensure feed.py and entrypoint.sh are copied correctly
RUN ls -l /usr/bin/feed.py
RUN ls -l /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]