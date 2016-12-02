class CartedProductsController < ApplicationController
  def index
    @carted_products = user_carted_products
    if @carted_products.count < 1
      redirect_to '/products'
    end
  end

  def create
    if (carted_product = user_carted_products.find_by(product_id: params[:product_id]))
      carted_product[:quantity] += params[:quantity].to_i
      carted_product.save
    else
      CartedProduct.create(
        quantity: params[:quantity],
        product_id: params[:product_id],
        status: "carted",
        user_id: session[:user_id],
        order_id: nil
        )
    end
    redirect_to '/carted_products'
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "removed")
    redirect_to '/carted_products'
  end
end
