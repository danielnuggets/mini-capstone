class CreateShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.string :status
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.integer :order_id

      t.timestamps
    end
  end
end
