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
        @portstocks_unique = port_portstocks_unique
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







private
    def portfolio_params
        params.require(:portfolio).permit(:name, :cash)
    end

    def port_portstocks_unique 
        @portstocks.uniq do |portstock|
            portstock.stock_id
        end
    end

    def portstock_shares_owned
        x = @portstocks.select{|ps| ps.stock_id == portstock.stock_id}
        @ps_shares = x.map { |pstock| pstock.shares}
        @ps_shares.sum
    end


end