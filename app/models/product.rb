class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories

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
