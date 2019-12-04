class PortfoliosController < ApplicationController
    def index
        @portfolios = Portfolio.all
    end

    def new 
        @portfolio = Portfolio.new
    end

    def create 
        portfolio = Portfolio.new(portfolio_params)
        portfolio.cash = 100000
        portfolio.save
        redirect_to portfolio_path(portfolio)
    end

    def show
        @portfolio = Portfolio.find(params[:id])
        @portstocks = @portfolio.portstocks
        session[:port_id] = @portfolio.id
    end

    def edit
        @portfolio = Portfolio.find(params[:id])
    end

    def update
        portfolio = Portfolio.find(params[:id])
        portfolio.update(portfolio_params)
        redirect_to portfolio_path(portfolio)
    end

    def delete
        portfolio = Portfolio.find(params[:id])
        portfolio.destroy
        redirect_to portfolios_path
    end

    # def buy 
    #     #how to link the 
    #     @portstock = Portstock.new
    # end






private
    def portfolio_params
        params.require(:portfolio).permit(:name, :cash)
    end

end