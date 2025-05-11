FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV IBC_HOME=/opt/ibc \
    IBG_HOME=/root/Jts/ibgateway/1019 \
    TWS_SETTINGS_PATH=/root/Jts/settings

# Install required packages
RUN apt-get update && \
    apt-get install -y \
      xvfb \
      openjdk-8-jdk \
      python3 python3-pip \
      libnss3 libxrender1 libxtst6 libxi6 \
      vim && \
    rm -rf /var/lib/apt/lists/*

# Copy IB Gateway jars and runtime
COPY Jts/ /root/Jts/

# Copy IBC files (ibcstart.sh, IBC.jar, config.ini)
COPY ibc/ /opt/ibc/

# Ensure IBC scripts are executable
RUN chmod +x /opt/ibc/*.sh

# Copy FastAPI application
COPY app/ /app/
WORKDIR /app
COPY app/requirements.txt /app/
RUN pip3 install -r /app/requirements.txt


# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Ensure TWS settings folder exists
RUN mkdir -p /root/Jts/settings

EXPOSE 4001 4002 8000

CMD ["/entrypoint.sh"]
