Rails.application.routes.draw do
#portfolios
get '/portfolios', to: "portfolios#index", as: "portfolios"
#new
#create
get '/portfolios/:id', to: "portfolios#show", as: "portfolio"
#buy
#get '/portfolios/:id/buy', to: "portfolios#buy", as: "buy"



#stocks
get '/stocks', to: "stocks#index", as: "stocks"
get '/stocks/:id', to: "stocks#show", as: "stock"
get '/stocks/:id/buy', to: "stocks#buy", as: "buy"




#portstocks
get '/portstocks', to: "portstocks#index", as: "portstocks"
post '/portstocks', to: "portstocks#create"
end
