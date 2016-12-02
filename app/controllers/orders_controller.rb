class OrdersController < ApplicationController
  def create
    carted_products = current_user.carted_products.where(status: "carted")

    order = Order.create(
      user_id: session[:user_id]
      )

    carted_products.each do |carted_product|
      carted_product.update(
        status: "purchased", 
        order_id: order.id
        )
    end

    order.update_subtotal_tax_and_total

    flash[:success] = "Thank you for your order!"
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
