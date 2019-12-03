class PortstocksController < ApplicationController
    def index
        @portstocks = Portstock.all
    end
     
    def create 
        @portstock = Portstock.create(portstock_params)
        redirect_to portstocks_path
    end





    private
    
    def portstock_params 
        params.require(:portstock).permit(:stock_id, :portfolio_id, :shares, :purchase_price)
    end    


end