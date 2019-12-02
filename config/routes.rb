Rails.application.routes.draw do
#portfolios
get '/portfolios', to: "portfolios#index", as: "portfolios"
#new
#create
get '/portfolios/:id', to: "portfolios#show", as: "portfolio"



#stocks
get '/stocks', to: "stocks#index", as: "stocks"
get '/stocks/:id', to: "stocks#show", as: "stock"




#portstocks
get '/portstocks', to: "portstocks#index", as: "portstocks"


end
