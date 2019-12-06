class ApplicationController < ActionController::Base
    helper_method :buyable_shares, :current_port, :port_present?

    def buyable_shares(port_id, stock_id)
        cash_available = Portfolio.find(port_id).cash
        current_stock_price = Stock.find(stock_id).price
        cash_available / current_stock_price
    end

    def current_port
        if session[:port_id]
            Portfolio.find(session[:port_id])
        end 
    end

    def port_present?
        !!current_port
    end

    
end
