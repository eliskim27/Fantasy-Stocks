class PortstocksController < ApplicationController
    helper_method :shares_owned

    def index
        @portstocks = Portstock.all
    end

    def buy 
        @portstock = Portstock.new
    end

    def sell 
        @total_amount_paid_for_stock = total_amount_paid_for_stock
        @shares_owned = shares_owned
        @portstock = Portstock.new
    end
 
    def sell_create
        share_count = params[:portstock][:shares].to_i
        stock_price = Stock.find(session[:stock_id]).price
        total_price = share_count * stock_price
        current_port = Portfolio.find(session[:port_id])
        port_cash = Portfolio.find(session[:port_id]).cash
        if share_count <= shares_owned
            @portstock = Portstock.new(
                stock_id: session[:stock_id], 
                portfolio_id: session[:port_id], 
                shares: -share_count, 
                purchase_price: Stock.find(session[:stock_id]).price)
            @portstock.save
            current_port.cash += total_price
            current_port.save
            redirect_to portfolio_path(session[:port_id])
        else
            flash[:message] = "You don't have enough shares brah!"
            redirect_to sell_portstock_path
        end
    end

    def buy_create
        share_count = params[:portstock][:shares].to_i
        stock_price = Stock.find(session[:stock_id]).price
        total_price = share_count * stock_price
        current_port = Portfolio.find(session[:port_id])
        port_cash = Portfolio.find(session[:port_id]).cash
        if share_count * stock_price <= port_cash
            @portstock = Portstock.new(
                stock_id: session[:stock_id], 
                portfolio_id: session[:port_id], 
                shares: params[:portstock][:shares], 
                purchase_price: Stock.find(session[:stock_id]).price)
            @portstock.save
            current_port.cash -= total_price
            current_port.save
            redirect_to portfolio_path(session[:port_id])    
        else
            flash[:message] = "You do not have enough cash brah!"
            redirect_to buy_portstock_path    
        end
    end


    private
    
    def portstock_params 
        params.require(:portstock).permit(:stock_id, :portfolio_id, :shares, :purchase_price)
    end    

    def shares_owned
        portstocks = portfolio_portstock
        stock = portstocks.select{ |portstock| portstock.stock_id == session[:stock_id]}
        shares = stock.map{ |stock| stock.shares}
        shares.sum
    end

    def portfolio_portstock
        portstocks = Portstock.all.select{ |portstock| portstock.portfolio_id == session[:port_id]}
    end

    def negative_shares
        params[:portstock][:shares] = (params[:portstock][:shares]) * -1
    end

    # def current_total_stock_value_owned
    #     stock = portfolio_portstocks.select{ |portstock| portstock.stock_id == session[:stock_id]}
    #     price = stock.map{ |stock| stock.Stocks.price}
    #     shares.sum
    # end

    def total_amount_paid_for_stock
        stocks = portfolio_portstock.select{ |portstock| portstock.stock_id == session[:stock_id]}
        pvalue = stocks.map{ |stock| stock.purchase_price * stock.shares}
        pvalue.sum
    end



end