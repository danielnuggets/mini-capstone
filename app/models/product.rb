class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: {greater_than: 0, less_than_or_equal_to: 100000}
  validates :stock, inclusion: { in: [true, false] }
  belongs_to :supplier, optional: true
  has_many :images
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :carted_products
  has_many :orders, through: :carted_products

  def sale_message
    if price < 2
      return "Discount Item!"
    else
      return "On Sale!"
    end
  end

  def style_message
    if price < 2
      return "red"
    else
      return ""
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def stock_status
    if stock
      return "In Stock"
    else
      return "Out of Stock"
    end
  end
end
