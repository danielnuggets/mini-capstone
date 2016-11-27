class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    order = Order.new(
      user_id: session[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity].to_i,
      subtotal: params[:quantity].to_i * product.price,
      tax: params[:quantity].to_i * product.price * 0.09,
      total: params[:quantity].to_i * product.price * 1.09
      )
    order.save
    flash[:success] = "Thank you for your order!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @product = Product.find_by(id: @order.product_id)
  end
end
