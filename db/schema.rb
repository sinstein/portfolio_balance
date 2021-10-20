# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_20_063702) do

  create_table "user_balance_histories", force: :cascade do |t|
    t.float "debt"
    t.float "equity"
    t.float "gold"
    t.integer "user_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_balance_histories_on_user_id"
  end

  create_table "user_balances", force: :cascade do |t|
    t.float "debt"
    t.float "equity"
    t.float "gold"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_balances_on_user_id"
  end

  create_table "user_portfolio_histories", force: :cascade do |t|
    t.date "date"
    t.integer "user_id", null: false
    t.integer "debt_value"
    t.integer "equity_value"
    t.integer "gold_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_portfolio_histories_on_user_id"
  end

  create_table "user_portfolios", force: :cascade do |t|
    t.integer "debt_allocation"
    t.integer "equity_allocation"
    t.integer "gold_allocation"
    t.integer "debt_sip"
    t.integer "equity_sip"
    t.integer "gold_sip"
    t.integer "user_id", null: false
    t.integer "debt_value"
    t.integer "equity_value"
    t.integer "gold_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_portfolios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "user_balance_histories", "users"
  add_foreign_key "user_balances", "users"
  add_foreign_key "user_portfolio_histories", "users"
  add_foreign_key "user_portfolios", "users"
end
