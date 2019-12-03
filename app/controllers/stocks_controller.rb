class StocksController < ApplicationController

    def index
        @stocks = Stock.all
        byebug

    end

    def show
        @stock = Stock.find(params[:id])
    end

    def buy 
        #how to link the 
        @portstock = Portstock.new
    end

    
    
    private
    def stock_params
        params.require(:stock).permit(:name, :symbol, :price)
    end








end