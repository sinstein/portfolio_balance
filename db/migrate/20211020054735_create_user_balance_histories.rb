class CreateUserBalanceHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :user_balance_histories do |t|
      t.float :debt
      t.float :equity
      t.float :gold
      t.references :user, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
