class ApplicationController < ActionController::Base
    helper_method :buyable_shares

    def buyable_shares(port_id, stock_id)
        cash_available = Portfolio.find(port_id).cash
        current_stock_price = Stock.find(stock_id).price
        cash_available / current_stock_price
    end


    
end
