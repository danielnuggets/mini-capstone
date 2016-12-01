class OrdersController < ApplicationController
  def create
    carted_products = current_user.carted_products.where(status: "carted")
    cart_subtotal = 0

    carted_products.each do |carted_product|
      cart_subtotal += carted_product.quantity * carted_product.product.price
    end

    order = Order.create(
      user_id: session[:user_id],
      subtotal: cart_subtotal,
      tax: cart_subtotal * 0.09,
      total: cart_subtotal * 1.09
      )

    carted_products.each do |carted_product|
      carted_product.update(status: "purchased", order_id: order.id)
    end

    flash[:success] = "Thank you for your order!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
