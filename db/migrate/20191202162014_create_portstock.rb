class CreatePortstock < ActiveRecord::Migration[6.0]
  def change
    create_table :portstocks do |t|
      t.integer :stock_id
      t.integer :portfolio_id
      t.integer :shares
      t.timestamps
    end
  end
end
