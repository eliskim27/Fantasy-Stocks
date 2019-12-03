class PortfoliosController < ApplicationController
    def index
        @portfolios = Portfolio.all
    end

    def new 
        @portfolio
    end

    def create 
    end

    def show
        @portfolio = Portfolio.find(params[:id])
        @portstocks = Portstock.select(params[:portfolio_id])
        session[:port_id] = @portfolio
    end

    def buy 
        #how to link the 
        @portstock = Portstock.new
    end





private
    def portfolio_params
        params.require(:portfolio).permit(:name, :cash)
    end

end