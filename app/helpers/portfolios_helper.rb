module PortfoliosHelper

    def percent_return(portstock, avg_stockp_paid)
        @per_return = ((portstock.stock.price - avg_stockp_paid).to_f/avg_stockp_paid.to_f)*100
        if @per_return > 0
            content_tag(:td, "#{number_to_percentage(@per_return)}", class: "text-success")
        elsif @per_return < 0
            content_tag(:td, "#{number_to_percentage(@per_return)}", class: "text-danger")
        else @per_return = 0    
            content_tag(:td, "#{number_to_percentage(@per_return)}")
        end     
        #byebug
    end

end

# <td><%= @per_return = ((portstock.stock.price - @avg_stockp_paid).to_f/@avg_stockp_paid).to_f*100
# if @per_return > 0
#     number_to_percentage(@per_return)
# elsif @per_return < 0
#     number_to_percentage(@per_return)
# else @per_return = 0    
#     number_to_percentage(@per_return)
# end     
# %>  
# </td> 