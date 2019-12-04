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
        redirect_to buy_portstock_path
    end

    def sell
        @stock = Stock.find(params[:id])
        session[:stock_id] = @stock.id
        redirect_to sell_portstock_path
    end

    
    
    private
    def stock_params
        params.require(:stock).permit(:name, :symbol, :price)
    end

    








end