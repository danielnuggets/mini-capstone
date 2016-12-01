class RenameShoppingCart < ActiveRecord::Migration[5.0]
  def change
    rename_table :shopping_carts, :carted_products
  end
end
