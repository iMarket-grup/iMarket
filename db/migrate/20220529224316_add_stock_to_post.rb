class AddStockToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :stock, :integer
    add_column :posts, :cut_price, :string
  end
end
