class PortstocksController < ApplicationController
    def index
        @portstocks = Portstock.all
    end

    def new 
        @portstock = Portstock.new
    end
 
    def create 
        @portstock = Portstock.new(
            stock_id: session[:stock_id], 
            portfolio_id: session[:port_id], 
            shares: params[:portstock][:shares], 
            purchase_price: Stock.find(session[:stock_id]).price)
        @portstock.save
        redirect_to portfolio_path(session[:port_id])
    end





    private
    
    def portstock_params 
        params.require(:portstock).permit(:stock_id, :portfolio_id, :shares, :purchase_price)
    end    


end