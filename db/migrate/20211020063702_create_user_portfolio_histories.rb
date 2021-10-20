class CreateUserPortfolioHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :user_portfolio_histories do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.integer :debt_value
      t.integer :equity_value
      t.integer :gold_value

      t.timestamps
    end
  end
end
