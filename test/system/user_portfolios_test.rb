require "application_system_test_case"

class UserPortfoliosTest < ApplicationSystemTestCase
  setup do
    @user_portfolio = user_portfolios(:one)
  end

  test "visiting the index" do
    visit user_portfolios_url
    assert_selector "h1", text: "User Portfolios"
  end

  test "creating a User portfolio" do
    visit user_portfolios_url
    click_on "New User Portfolio"

    fill_in "Debt allocation", with: @user_portfolio.debt_allocation
    fill_in "Debt sip", with: @user_portfolio.debt_sip
    fill_in "Debt value", with: @user_portfolio.debt_value
    fill_in "Equity allocation", with: @user_portfolio.equity_allocation
    fill_in "Equity sip", with: @user_portfolio.equity_sip
    fill_in "Equity value", with: @user_portfolio.equity_value
    fill_in "Gold allocation", with: @user_portfolio.gold_allocation
    fill_in "Gold sip", with: @user_portfolio.gold_sip
    fill_in "Gold value", with: @user_portfolio.gold_value
    fill_in "User", with: @user_portfolio.user_id
    click_on "Create User portfolio"

    assert_text "User portfolio was successfully created"
    click_on "Back"
  end

  test "updating a User portfolio" do
    visit user_portfolios_url
    click_on "Edit", match: :first

    fill_in "Debt allocation", with: @user_portfolio.debt_allocation
    fill_in "Debt sip", with: @user_portfolio.debt_sip
    fill_in "Debt value", with: @user_portfolio.debt_value
    fill_in "Equity allocation", with: @user_portfolio.equity_allocation
    fill_in "Equity sip", with: @user_portfolio.equity_sip
    fill_in "Equity value", with: @user_portfolio.equity_value
    fill_in "Gold allocation", with: @user_portfolio.gold_allocation
    fill_in "Gold sip", with: @user_portfolio.gold_sip
    fill_in "Gold value", with: @user_portfolio.gold_value
    fill_in "User", with: @user_portfolio.user_id
    click_on "Update User portfolio"

    assert_text "User portfolio was successfully updated"
    click_on "Back"
  end

  test "destroying a User portfolio" do
    visit user_portfolios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User portfolio was successfully destroyed"
  end
end
