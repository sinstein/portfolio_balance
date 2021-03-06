class UserPortfolioHistoriesController < ApplicationController
  before_action :set_user_portfolio_history, only: %i[ show edit update destroy ]

  # GET /user_portfolio_histories or /user_portfolio_histories.json
  def index
    @user_portfolio_histories = UserPortfolioHistory.all
  end

  # GET /user_portfolio_histories/1 or /user_portfolio_histories/1.json
  def show
  end

  # GET /user_portfolio_histories/new
  def new
    @user_portfolio_history = UserPortfolioHistory.new
  end

  # GET /user_portfolio_histories/1/edit
  def edit
  end

  # POST /user_portfolio_histories or /user_portfolio_histories.json
  def create
    @user_portfolio_history = UserPortfolioHistory.new(user_portfolio_history_params)

    respond_to do |format|
      if @user_portfolio_history.save
        format.html { redirect_to @user_portfolio_history, notice: "User portfolio history was successfully created." }
        format.json { render :show, status: :created, location: @user_portfolio_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_portfolio_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_portfolio_histories/1 or /user_portfolio_histories/1.json
  def update
    respond_to do |format|
      if @user_portfolio_history.update(user_portfolio_history_params)
        format.html { redirect_to @user_portfolio_history, notice: "User portfolio history was successfully updated." }
        format.json { render :show, status: :ok, location: @user_portfolio_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_portfolio_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_portfolio_histories/1 or /user_portfolio_histories/1.json
  def destroy
    @user_portfolio_history.destroy
    respond_to do |format|
      format.html { redirect_to user_portfolio_histories_url, notice: "User portfolio history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_portfolio_history
      @user_portfolio_history = UserPortfolioHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_portfolio_history_params
      params.require(:user_portfolio_history).permit(:date, :user_id, :debt_value, :equity_value, :gold_value)
    end
end
