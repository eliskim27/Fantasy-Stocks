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
 
    def create
        # if params[:commit] == "Sell"
        #     params[:portstock][:shares] = -params[:portstock][:shares].to_i
        #     if (params[:portstock][:shares]) <= shares_owned
        #     else
        #         # some error handling
        #     end
        # else
        #     if ((params[:portstock][:shares])*(Stock.find(session[:stock_id]).price)).to_i <= Portfolio.find(session[:port_id]).cash
        #     else
        #         # "some error handlin"
        #     end
        # end
        @portstock = Portstock.new(
            stock_id: session[:stock_id], 
            portfolio_id: session[:port_id], 
            shares: params[:portstock][:shares], 
            purchase_price: Stock.find(session[:stock_id]).price)
        @portstock.save
        redirect_to portfolio_path(session[:port_id])
    end

    # Sell: <ActionController::Parameters {"authenticity_token"=>"MZVO12ODZ7wvZcaJaRKF0k/laQ8bg6KWAHHhYkLyPjBnXn+LSXLOCBK2opKFf8BF+Ds4diTzljjVFgFoBDs3wg==", "portstock"=>{"shares"=>"10"}, "commit"=>"Sell", "controller"=>"portstocks", "action"=>"create"} permitted: false>
    # Buy: <ActionController::Parameters {"authenticity_token"=>"+XIz+h7HQQN1E9GvcvNwX+aHSnGSDepbzWRkx6Gq9N+U26ULd8gcbecS44Pt+8e1oZDxSCRGMfHjkQO4Vd3z4A==", "portstock"=>{"shares"=>"2"}, "commit"=>"Buy", "controller"=>"portstocks", "action"=>"create"} permitted: false>
    # (byebug) params.keys ["authenticity_token", "portstock", "commit", "controller", "action"]


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