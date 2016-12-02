class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal
    order_subtotal = 0
    carted_products.each do |carted_product|
      order_subtotal += carted_product.quantity * carted_product.product.price
    end
    order_subtotal
  end

  def calculate_tax
    calculate_subtotal * 0.09
  end

  def calculate_total
    calculate_subtotal + calculate_tax
  end

  def update_subtotal_tax_and_total
    update(
      subtotal: calculate_subtotal,
      tax: calculate_tax,
      total: calculate_total
      )
  end
end
