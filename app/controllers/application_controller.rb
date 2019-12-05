class ApplicationController < ActionController::Base
    helper_method :portfolio_cash

    def portfolio_cash(portfolio)
        #Portfolio.find(session[:port_id]).cash
        Portfolio.find(portfolio).cash
    end


    
end
