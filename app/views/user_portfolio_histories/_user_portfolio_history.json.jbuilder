json.extract! user_portfolio_history, :id, :date, :user_id, :debt_value, :equity_value, :gold_value, :created_at, :updated_at
json.url user_portfolio_history_url(user_portfolio_history, format: :json)
