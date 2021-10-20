require 'test_helper'

class UserPortfolioHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_portfolio_history = user_portfolio_histories(:one)
  end

  test "should get index" do
    get user_portfolio_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_user_portfolio_history_url
    assert_response :success
  end

  test "should create user_portfolio_history" do
    assert_difference('UserPortfolioHistory.count') do
      post user_portfolio_histories_url, params: { user_portfolio_history: { date: @user_portfolio_history.date, debt_value: @user_portfolio_history.debt_value, equity_value: @user_portfolio_history.equity_value, gold_value: @user_portfolio_history.gold_value, user_id: @user_portfolio_history.user_id } }
    end

    assert_redirected_to user_portfolio_history_url(UserPortfolioHistory.last)
  end

  test "should show user_portfolio_history" do
    get user_portfolio_history_url(@user_portfolio_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_portfolio_history_url(@user_portfolio_history)
    assert_response :success
  end

  test "should update user_portfolio_history" do
    patch user_portfolio_history_url(@user_portfolio_history), params: { user_portfolio_history: { date: @user_portfolio_history.date, debt_value: @user_portfolio_history.debt_value, equity_value: @user_portfolio_history.equity_value, gold_value: @user_portfolio_history.gold_value, user_id: @user_portfolio_history.user_id } }
    assert_redirected_to user_portfolio_history_url(@user_portfolio_history)
  end

  test "should destroy user_portfolio_history" do
    assert_difference('UserPortfolioHistory.count', -1) do
      delete user_portfolio_history_url(@user_portfolio_history)
    end

    assert_redirected_to user_portfolio_histories_url
  end
end
