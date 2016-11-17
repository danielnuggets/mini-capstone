class AddStuffToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :description, :text
    change_column :products, :price, :decimal, precision: 8, scale: 2
    add_column :products, :stock, :boolean
  end
end
