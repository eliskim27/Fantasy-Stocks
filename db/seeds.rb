Portfolio.destroy_all
Stock.destroy_all
Portstock.destroy_all

port1 = Portfolio.create(name: "test 1", cash: 100000)
port2 = Portfolio.create(name: "test 2", cash: 100000)
port3 = Portfolio.create(name: "test 3", cash: 100000)

google = Stock.create(name: "Google", symbol: "GOOGL", price: 1800)
amazon = Stock.create(name: "Amazon", symbol: "AMZN", price: 1500)
apple = Stock.create(name: "Apple", symbol: "APPL", price: 1208)
tesla = Stock.create(name: "Tesla", symbol: "TSLA", price: 539)
roku = Stock.create(name: "Roku", symbol: "ROKU", price: 63)


Portstock.create(stock_id: google.id, portfolio_id: port1.id, shares: 50, purchase_price: 100)
Portstock.create(stock_id: amazon.id, portfolio_id: port2.id, shares: 40, purchase_price: 100)
Portstock.create(stock_id: apple.id, portfolio_id: port3.id, shares: 20, purchase_price: 100)
Portstock.create(stock_id: tesla.id, portfolio_id: port1.id, shares: 700, purchase_price: 100)
Portstock.create(stock_id: roku.id, portfolio_id: port2.id, shares: 9999, purchase_price: 100)