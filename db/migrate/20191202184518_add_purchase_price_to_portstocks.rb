class AddPurchasePriceToPortstocks < ActiveRecord::Migration[6.0]
  def change
    add_column :portstocks, :purchase_price, :integer
  end
end
