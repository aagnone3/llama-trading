import os
import alpaca_trade_api as trade_api

api = trade_api.REST(os.environ["APCA_API_KEY_ID"], os.environ["APCA_API_SECRET_KEY"])
account = api.get_account()
print(account.status)
