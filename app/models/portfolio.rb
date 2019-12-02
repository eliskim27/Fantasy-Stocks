class Portfolio < ApplicationRecord
    has_many :portstocks
    has_many :stocks, through: :portstocks




end
