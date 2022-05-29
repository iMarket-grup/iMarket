class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :amount
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
