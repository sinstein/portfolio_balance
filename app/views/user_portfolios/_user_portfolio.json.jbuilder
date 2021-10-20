json.extract! user_portfolio, :id, :debt_allocation, :equity_allocation, :gold_allocation, :debt_sip, :equity_sip, :gold_sip, :user_id, :debt_value, :equity_value, :gold_value, :created_at, :updated_at
json.url user_portfolio_url(user_portfolio, format: :json)
