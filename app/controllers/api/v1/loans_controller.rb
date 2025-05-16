class Api::V1::LoansController < ApplicationController
    before_action :authentication_user, except: [:index]
    before_action :set_loan, only: [:show, :update, :destroy, :return_book]
  
    # GET /api/v1/loans
    def index
      @loans = Loan.includes(:user, :book)
      render json: @loans
    end
  
    # GET /api/v1/loans/1
    def show
      render json: @loan
    end
  
    # POST /api/v1/loans
    def create
      @loan = Loan.new(loan_params)
  
      if @loan.save
        render json: @loan, status: :created
      else
        render json: @loan.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/loans/1
    def update
      if @loan.update(loan_params)
        render json: @loan
      else
        render json: @loan.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/loans/1
    def destroy
      @loan.destroy
      head :no_content
    end
    
    # PATCH /api/v1/loans/1/return_book
    def return_book
      if @loan.update(returned: true, return_date: Date.today)
        render json: @loan
      else
        render json: @loan.errors, status: :unprocessable_entity
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_loan
        @loan = Loan.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def loan_params
        params.require(:loan).permit(:user_id, :book_id, :checkout_date, :return_date, :returned)
      end
  end
  