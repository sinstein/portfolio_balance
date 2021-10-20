class UserBalancesController < ApplicationController
    def update(price_change_params)
        user_balances = UserBalance.all
        user_balances.each do |user_balance|
            user_balance.equity = user_balance.equity * (1 + price_change_params.equity)
            user_balance.debt = user_balance.debt * (1 + price_change_params.debt)
            user_balance.gold = user_balance.gold * (1 + price_change_params.gold)
        end
    end

    def rebalance
    end

    def price_change_params
        params.require(:equity, :debt, :gold)
    end
end
