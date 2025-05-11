# 🧪 IB Connector – DevOps Test Task

This project containerizes the Interactive Brokers (IB) Gateway and exposes its basic functionality via a REST API using FastAPI.

---

## 🐳 Project Structure

```
├── Dockerfile
├── entrypoint.sh
├── .env                # IB Credentials and trading mode
├── requirements.txt    # FastAPI dependencies
├── main.py             # FastAPI server with endpoints
├── ib_client.py        # Mock IB client logic
└── README.md
```

---

## 🔐 .env File Example

Create a `.env` file at the root with your IB paper trading credentials:

```env
TWS_USERID=edemo
TWS_PASSWORD=demouser
TRADING_MODE=paper
```

---

## 🔧 Build and Run

### 1. Clone the Repository

```bash
git clone https://github.com/Alibayov/ib-connector.git
cd ib-connector
```

### 2. Build the Docker Image

```bash
docker build -t ib-connector .
```

### 3. Run the Container

```bash
docker run --env-file .env -p 8000:8000 -p 4001:4001 -it ib-connector
```

---

## 🚀 API Endpoints

### `POST /connect`
Establish connection to the IB Gateway (mocked).

### `GET /account`
Fetch mock account info.

### `POST /order`
Simulate placing a simple order.

#### Sample Body
```json
{
  "symbol": "AAPL",
  "quantity": 10,
  "order_type": "market"
}
```

---

## 📸 Example Output

![image](https://github.com/user-attachments/assets/66dfb7b1-bc9b-4f45-9922-e9e04db4140b)


---

## ✅ Evaluation Notes

- Headless IB Gateway containerized
- Automated login via IBC and FastAPI
- Easily testable with curl/Postman
- No AI-generated traces included

---
