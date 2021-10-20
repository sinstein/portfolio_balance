class UserBalance < ApplicationRecord
  belongs_to :user

  def create(user, initial_amounts, sip_amounts)
    UserBalance.create!(equity: equity, debt: debt, gold: gold, user: user)
  end
end
