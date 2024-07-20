FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git \
  build-essential \
  libyaml-dev \
  curl

# Test network connectivity
RUN curl -I https://pypi.org

# Upgrade pip and setuptools
RUN pip3 install --upgrade pip setuptools

# Install PyYAML with verbose output for debugging
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