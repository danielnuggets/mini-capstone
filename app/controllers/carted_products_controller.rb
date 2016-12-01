class CartedProductsController < ApplicationController
  def index
    @carted_products = user_carted_products
    p "*" * 50
    p @carted_products
    p "*" * 50

    if @carted_products == []
      redirect_to '/products'
    end
  end

  def create
    CartedProduct.create(
      quantity: params[:quantity],
      product_id: params[:product_id],
      status: "carted",
      user_id: session[:user_id],
      order_id: nil
      )
    redirect_to '/carted_products'
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "removed")
    redirect_to '/carted_products'
  end
end
