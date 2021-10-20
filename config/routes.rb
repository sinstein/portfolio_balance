Rails.application.routes.draw do
  resources :user_portfolio_histories
  resources :users
  resources :user_portfolios
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/market_updates", to: "user_portfolios#update_all"
  post "/rebalance", to: "user_portfolios#rebalance"
  post "/update_sip", to: "user_portfolios#update_sip"

end
