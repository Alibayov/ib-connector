def connect_to_ib():
    print("[MOCK] Connecting to IB Gateway...")
    return True

def get_account_info():
    return {
        "account_id": "DU1234567",
        "balance": 100000.0,
        "currency": "USD"
    }

def place_order(symbol, quantity, order_type):
    return {
        "status": "order_placed",
        "symbol": symbol,
        "quantity": quantity,
        "order_type": order_type
    }
