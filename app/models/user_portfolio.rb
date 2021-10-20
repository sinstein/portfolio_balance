class UserPortfolio < ApplicationRecord
  belongs_to :user

  def market_updates(update_params)
    up = self
    puts "Update for #{up}"
    uphistory = UserPortfolioHistory.create!(
      user_id: up.user_id, 
      equity_value: up.equity_value,
      gold_value: up.gold_value,
      debt_value: up.debt_value
    )
    debugger
    up.equity_value = up.equity_value * (1 + update_params[:equity_change].to_f/100) + up.equity_sip
    up.gold_value = up.gold_value * (1 + update_params[:gold_change].to_f/100) + up.gold_sip
    up.debt_value = up.debt_value * (1 + update_params[:debt_change].to_f/100) + up.debt_sip
    up.save!
  end

  def rebalance
      up = self
      up_history = UserPortfolioHistory.where(user_id: up.user_id)

      if(up_history.count < 6) 
        "CANNOT_REBALANCE"
      else
        uphistory = UserPortfolioHistory.create!(
          user_id: up.user_id, 
          equity_value: up.equity_value,
          gold_value: up.gold_value,
          debt_value: up.debt_value
        )
        total_allocation = up.equity_value + up.gold_value + up.debt_value

        up.gold_value = total_allocation * (up.gold_allocation.to_f / 100)
        up.equity_value = total_allocation * (up.equity_allocation.to_f / 100)
        up.debt_value = total_allocation * (up.debt_allocation.to_f / 100)
        up.save!
      end
  end
end
