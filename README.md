# IB Connector

This repository provides a containerized Interactive Brokers (IB) Gateway running in headless mode using IB Controller (IBC). A FastAPI-based REST API is included to interact with the gateway for basic connection and mock trading functionality.

---

## 📌 Features

- ✅ IB Gateway in headless mode (v1019 standalone)
- ✅ Automated login via IBC
- ✅ Lightweight FastAPI service with mock endpoints
- ✅ Dockerized, portable setup
- ✅ API testable via Postman / curl

---

## ⚙️ Requirements

- Docker
- Git
- Internet access (for initial build)

---

## 📂 Folder Structure

.
├── app/ # FastAPI source code
│ ├── main.py
│ └── ib_client.py
├── ibc/ # IB Controller files (IBC.jar, config.ini)
├── Jts/ # IB Gateway directory with required jars
├── Dockerfile
├── entrypoint.sh
├── .env # Credentials and trading mode
├── requirements.txt
└── README.md

yaml
Copy
Edit

---

## 🔐 .env File Example

Create a `.env` file at the root with your IB paper trading credentials:

```env
TWS_USERID=edemo
TWS_PASSWORD=demouser
TRADING_MODE=paper
🐳 Build and Run
1. Clone the Repository
bash
Copy
Edit
git clone https://github.com/YOUR_USERNAME/ib-connector.git
cd ib-connector
2. Build the Docker Image
bash
Copy
Edit
docker build -t ib-connector .
3. Run the Container
bash
Copy
Edit
docker run --env-file .env -p 8000:8000 -p 4001:4001 -it ib-connector
🚀 API Endpoints
Method	Endpoint	Description
POST	/connect	Establish mock connection
GET	/account	Fetch dummy account data
POST	/order	Simulate order (mock implementation)

Example curl requests
bash
Copy
Edit
curl -X POST http://localhost:8000/connect
curl http://localhost:8000/account
curl -X POST http://localhost:8000/order -H "Content-Type: application/json" \
     -d '{"symbol": "AAPL", "quantity": 10, "order_type": "market"}'
📸 Screenshots

![image](https://github.com/user-attachments/assets/199645be-b8c6-4c8a-a3a8-92f5af803286)



📦 Technologies
Ubuntu 22.04

IB Gateway 1019

IB Controller (IBC) 3.21.2

OpenJDK 8

FastAPI + Uvicorn

Docker

📝 Notes
This setup is meant for demonstration and testing purposes.

API logic uses mock functions and does not execute real trades.

IB Gateway is launched in headless mode with automated credentials.
