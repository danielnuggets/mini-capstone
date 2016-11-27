class OrdersController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    order = Order.create(
      user_id: session[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity].to_i,
      subtotal: params[:quantity].to_i * product.price,
      tax: params[:quantity].to_i * product.tax,
      total: params[:quantity].to_i * product.total,
      )
    flash[:success] = "Thank you for your order!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
