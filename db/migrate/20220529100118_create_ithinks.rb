class CreateIthinks < ActiveRecord::Migration[6.1]
  def change
    create_table :ithinks do |t|
      t.string :name
      t.string :surname
      t.string :content

      t.timestamps
    end
  end
end
