require 'test_helper'

class UserPortfoliosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_portfolio = user_portfolios(:one)
  end

  test "should get index" do
    get user_portfolios_url
    assert_response :success
  end

  test "should get new" do
    get new_user_portfolio_url
    assert_response :success
  end

  test "should create user_portfolio" do
    assert_difference('UserPortfolio.count') do
      post user_portfolios_url, params: { user_portfolio: { debt_allocation: @user_portfolio.debt_allocation, debt_sip: @user_portfolio.debt_sip, debt_value: @user_portfolio.debt_value, equity_allocation: @user_portfolio.equity_allocation, equity_sip: @user_portfolio.equity_sip, equity_value: @user_portfolio.equity_value, gold_allocation: @user_portfolio.gold_allocation, gold_sip: @user_portfolio.gold_sip, gold_value: @user_portfolio.gold_value, user_id: @user_portfolio.user_id } }
    end

    assert_redirected_to user_portfolio_url(UserPortfolio.last)
  end

  test "should show user_portfolio" do
    get user_portfolio_url(@user_portfolio)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_portfolio_url(@user_portfolio)
    assert_response :success
  end

  test "should update user_portfolio" do
    patch user_portfolio_url(@user_portfolio), params: { user_portfolio: { debt_allocation: @user_portfolio.debt_allocation, debt_sip: @user_portfolio.debt_sip, debt_value: @user_portfolio.debt_value, equity_allocation: @user_portfolio.equity_allocation, equity_sip: @user_portfolio.equity_sip, equity_value: @user_portfolio.equity_value, gold_allocation: @user_portfolio.gold_allocation, gold_sip: @user_portfolio.gold_sip, gold_value: @user_portfolio.gold_value, user_id: @user_portfolio.user_id } }
    assert_redirected_to user_portfolio_url(@user_portfolio)
  end

  test "should destroy user_portfolio" do
    assert_difference('UserPortfolio.count', -1) do
      delete user_portfolio_url(@user_portfolio)
    end

    assert_redirected_to user_portfolios_url
  end
end
