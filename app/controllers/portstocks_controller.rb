class PortstocksController < ApplicationController
    def index
        @portstocks = Portstock.all
    end









end