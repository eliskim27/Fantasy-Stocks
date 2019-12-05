Rails.application.routes.draw do
#portfolios
get '/portfolios', to: "portfolios#index", as: "portfolios"
get '/portfolios/new', to: "portfolios#new", as: "new_portfolio"
post '/portfolios', to: "portfolios#create"
get '/portfolios/:id', to: "portfolios#show", as: "portfolio"
get '/portfolios/:id/edit', to: "portfolios#edit", as: "edit_portfolio"
patch '/portfolios/:id', to: "portfolios#update"
delete '/portfolios/:id', to: "portfolios#delete"


#stocks
get '/stocks', to: "stocks#index", as: "stocks"
get '/stocks/:id', to: "stocks#show", as: "stock"
get '/stocks/:id/buy', to: "stocks#buy", as: "buy"
get '/stocks/:id/sell', to: "stocks#sell", as: "sell"



#portstocks
get '/portstocks', to: "portstocks#index", as: "portstocks"
get '/portstocks/buy', to: "portstocks#buy", as: "buy_portstock"
get '/portstocks/sell', to: "portstocks#sell", as: "sell_portstock"
# post '/portstocks', to: "portstocks#create"
post '/portstocks/buy', to: "portstocks#buy_create", as: "buy_create"
post '/portstocks/sell', to: "portstocks#sell_create", as: "sell_create"


end
