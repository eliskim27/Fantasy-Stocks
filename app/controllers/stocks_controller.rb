class StocksController < ApplicationController

    def index
        @stocks = Stock.all
    end

    def show
        @stock = Stock.find(params[:id])
    end

    
    
    private
    def stock_params
        params.require(:stock).permit(:name, :symbol, :price)
    end








end