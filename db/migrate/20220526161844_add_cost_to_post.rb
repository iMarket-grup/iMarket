class AddCostToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :cost, :integer
  end
end
