require "application_system_test_case"

class UserPortfolioHistoriesTest < ApplicationSystemTestCase
  setup do
    @user_portfolio_history = user_portfolio_histories(:one)
  end

  test "visiting the index" do
    visit user_portfolio_histories_url
    assert_selector "h1", text: "User Portfolio Histories"
  end

  test "creating a User portfolio history" do
    visit user_portfolio_histories_url
    click_on "New User Portfolio History"

    fill_in "Date", with: @user_portfolio_history.date
    fill_in "Debt value", with: @user_portfolio_history.debt_value
    fill_in "Equity value", with: @user_portfolio_history.equity_value
    fill_in "Gold value", with: @user_portfolio_history.gold_value
    fill_in "User", with: @user_portfolio_history.user_id
    click_on "Create User portfolio history"

    assert_text "User portfolio history was successfully created"
    click_on "Back"
  end

  test "updating a User portfolio history" do
    visit user_portfolio_histories_url
    click_on "Edit", match: :first

    fill_in "Date", with: @user_portfolio_history.date
    fill_in "Debt value", with: @user_portfolio_history.debt_value
    fill_in "Equity value", with: @user_portfolio_history.equity_value
    fill_in "Gold value", with: @user_portfolio_history.gold_value
    fill_in "User", with: @user_portfolio_history.user_id
    click_on "Update User portfolio history"

    assert_text "User portfolio history was successfully updated"
    click_on "Back"
  end

  test "destroying a User portfolio history" do
    visit user_portfolio_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User portfolio history was successfully destroyed"
  end
end
