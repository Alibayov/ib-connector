from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from ib_client import connect_to_ib, get_account_info, place_order

app = FastAPI()

@app.post("/connect")
def connect():
    if not connect_to_ib():
        raise HTTPException(status_code=500, detail="Failed to connect to IB Gateway")
    return {"message": "Connected to IB Gateway"}

@app.get("/account")
def get_account():
    return get_account_info()

class Order(BaseModel):
    symbol: str
    quantity: int
    order_type: str

@app.post("/order")
def order(order: Order):
    return place_order(order.symbol, order.quantity, order.order_type)
