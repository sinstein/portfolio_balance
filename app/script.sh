#  curl -d '{"user":{"name":"abc""
# "initial_amounts":500}}' -H "Content-Type: application/json" -X POST http://localhost:3000/users
#  curl -d '{"user_portfolio":{"equity_value":3000,
#  "gold_value":1000,
#  "debt_value":2000,
#  "equity_sip":1000,
#  "gold_sip":500,
#  "debt_sip":2000,
#  "user_id":2}}' -H "Content-Type: application/json" -X POST http://localhost:3000/user_portfolios

#   curl -d '{"user_portfolio":{"debt_allocation":6000,
#  "equity_allocation":3000,
#  "gold_allocation":1000,
#  "debt_sip":2000,
#  "equity_sip":1000,
#  "gold_sip":500,
#  "user_id":1,
#  "debt_value":0,
#  "equity_value":0,
#  "gold_value":0}}' -H "Content-Type: application/json" -X POST http://localhost:3000/user_portfolios

   curl -d '{"user_portfolio":{"debt_change":-6,
 "equity_change":3,
 "gold_change":1}}' -H "Content-Type: application/json" -X POST http://localhost:3000/market_updates