class Stock < ApplicationRecord
    has_many :portstocks
    has_many :portfolios, through: :portstocks




end
