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


#portstocks
get '/portstocks', to: "portstocks#index", as: "portstocks"
get '/portstocks/new', to: "portstocks#new", as: "new_portstock"
post '/portstocks', to: "portstocks#create"

end
