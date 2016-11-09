class ProductsController < ApplicationController
  def display_all_products
    @products = Product.all
    render 'all_products.html.erb'
  end
end
