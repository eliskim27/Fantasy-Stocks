Rails.application.routes.draw do
#portfolios
get '/portfolios', to: "portfolios#index", as: "portfolios"
#new
#create
get '/portfolios/:id', to: "portfolios#show", as: "portfolio"



#stocks




#portstocks


end
