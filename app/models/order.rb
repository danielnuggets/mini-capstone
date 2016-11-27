class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true
  def calculate_subtotal(quantity, price)
    quantity * price
  end
end
