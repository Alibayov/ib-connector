#!/bin/bash

echo "[INFO] Starting virtual display..."
Xvfb :1 -screen 0 1024x768x16 > /var/log/xvfb.log 2>&1 &

echo "[INFO] Launching IB Gateway via IBC..."
mkdir -p /root/Jts/settings

# JVM options file (ensure it's present)
cat <<EOF > /root/Jts/ibgateway/1019/ibgateway.vmoptions
-Xmx256m
-XX:+UseG1GC
-XX:MaxGCPauseMillis=200
EOF

cd "$IBC_HOME"
/opt/ibc/ibcstart.sh "1019" \
  --gateway \
  --tws-path="/root/Jts" \
  --tws-settings-path="/root/Jts/settings" \
  --user="$TWS_USERID" \
  --pw="$TWS_PASSWORD" \
  --mode="$TRADING_MODE" \
  --java-path="/usr/bin" \
  --ibc-ini=/opt/ibc/config.ini \
  --on2fatimeout=exit &

echo "[INFO] Launching FastAPI server..."
cd /app
uvicorn main:app --host 0.0.0.0 --port 8000
