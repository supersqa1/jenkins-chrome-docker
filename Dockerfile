FROM jenkins/jenkins:2.452.4-jdk11

# Install dependencies and Snapd
USER root
RUN apt-get update && apt-get install -y \
    wget \
    vim \
    gnupg2 \
    ca-certificates \
    snapd \
    unzip \
    xvfb \
    libxi6 \
    tini \
    libgconf-2-4 \
    python3 \
    python3-venv \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable xvfb \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV CHROME_BIN='/usr/bin/google-chrome-stable'
ENV DISPLAY=:99

# Switch to Jenkins user
USER jenkins

# Set the working directory
WORKDIR /example_selenium

# Copy the Selenium script to the container
COPY selenium_demo.py .

# Create a Python virtual environment and install Selenium
RUN python3 -m venv myenv \
    && . myenv/bin/activate \
    && pip install --upgrade pip \
    && pip install selenium

# Run the Selenium script
CMD . myenv/bin/activate && python selenium_demo.py
