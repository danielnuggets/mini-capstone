class ProductsController < ApplicationController
  def display_all_products
    @products = Product.all
    render 'all_products.html.erb'
  end

  def add_product
    render 'add_product.html.erb'
  end

  def added_product_confirmation
    contact = Product.new(
      name: params["name"], 
      price: params["price"], 
      image: params["image"], 
      description: params["description"]
      )
    contact.save
    render 'added_product_confirmation.html.erb'
  end
end
