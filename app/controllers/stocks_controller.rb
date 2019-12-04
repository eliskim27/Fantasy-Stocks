class StocksController < ApplicationController

    def index
        @stocks = Stock.all
    end

    def show
        @stock = Stock.find(params[:id])
    end

    def buy
        @stock = Stock.find(params[:id])
        session[:stock_id] = @stock.id
        redirect_to new_portstock_path
    end

    
    
    private
    def stock_params
        params.require(:stock).permit(:name, :symbol, :price)
    end








end