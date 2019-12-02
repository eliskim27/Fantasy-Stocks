class PortfoliosController < ApplicationController
    def index
        @portfolios = Portfolio.all
    end

    def show
        @portfolio = Portfolio.find(params[:id])
        @portstocks = Portstock.select(params[:portfolio_id])
    end





private
    def portfolio_params
        params.require(:portfolio).permit(:name, :cash)
    end

end