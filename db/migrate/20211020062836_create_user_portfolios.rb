class CreateUserPortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :user_portfolios do |t|
      t.integer :debt_allocation
      t.integer :equity_allocation
      t.integer :gold_allocation
      t.integer :debt_sip
      t.integer :equity_sip
      t.integer :gold_sip
      t.references :user, null: false, foreign_key: true
      t.integer :debt_value
      t.integer :equity_value
      t.integer :gold_value

      t.timestamps
    end
  end
end
