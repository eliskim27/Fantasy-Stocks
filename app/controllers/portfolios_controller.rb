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
        @portstocks_w_shares = portstocks_w_shares
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

    def portstocks_w_shares
        @ps_uniq_shares = []
        @portstocks_unique.each do |portstock|
            @ps_shares = stocks_in_question(portstock).map do |pstock| 
                pstock.shares
            end
            if @ps_shares.sum > 0
                @ps_uniq_shares << portstock
            end
        end
        @ps_uniq_shares
    end

    def stocks_in_question(portstock)
        @portstocks.select do |ps|
            ps.stock.id == portstock.stock_id
        end
    end


end