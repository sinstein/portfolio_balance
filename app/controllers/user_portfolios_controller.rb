class UserPortfoliosController < ApplicationController
  before_action :set_user_portfolio, only: %i[ show edit update destroy ]

  # GET /user_portfolios or /user_portfolios.json
  def index
    @user_portfolios = UserPortfolio.all
  end

  # GET /user_portfolios/1 or /user_portfolios/1.json
  def show
  end

  # GET /user_portfolios/new
  def new
    @user_portfolio = UserPortfolio.new
  end

  # GET /user_portfolios/1/edit
  def edit
  end

  # POST /user_portfolios or /user_portfolios.json
  def create
    @user_portfolio = UserPortfolio.new(user_portfolio_params)
    total_allocation = @user_portfolio.equity_value + @user_portfolio.debt_value + @user_portfolio.gold_value

    @user_portfolio.equity_allocation = 100 * @user_portfolio.equity_value.to_f / total_allocation
    @user_portfolio.debt_allocation = 100 * @user_portfolio.debt_value.to_f / total_allocation
    @user_portfolio.gold_allocation = 100 * @user_portfolio.gold_value.to_f / total_allocation

    respond_to do |format|
      if @user_portfolio.save
        format.html { redirect_to @user_portfolio, notice: "User portfolio was successfully created." }
        format.json { render :show, status: :created, location: @user_portfolio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_sip
    @user_portfolio = UserPortfolio.find_by_user_id(params[:id])
    @user_portfolio.equity_sip = params[:equty_sip]
    @user_portfolio.debt_sip = params[:debt_sip]
    @user_portfolio.gold_sip = params[:gold_sip]

    respond_to do |format|
      if @user_portfolio.save
        format.html { redirect_to @user_portfolio, notice: "User portfolio was successfully created." }
        format.json { render :show, status: :created, location: @user_portfolio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_portfolio.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_all
    UserPortfolio.all.each do |up|
      up.market_updates(user_portfolio_update_params)
    end
  end


  def rebalance
    UserPortfolio.all.each do |up|
      up.rebalance
    end
  end

  # DELETE /user_portfolios/1 or /user_portfolios/1.json
  def destroy
    @user_portfolio.destroy
    respond_to do |format|
      format.html { redirect_to user_portfolios_url, notice: "User portfolio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_portfolio
      @user_portfolio = UserPortfolio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_portfolio_params
      params.require(:user_portfolio).permit(:debt_sip, :equity_sip, :gold_sip, :user_id, :debt_value, :equity_value, :gold_value)
    end

    def user_portfolio_update_params
      params.require(:user_portfolio).permit(:debt_change, :equity_change, :gold_change)
    end
end
