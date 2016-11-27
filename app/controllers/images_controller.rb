class ImagesController < ApplicationController
  def new
  end

  def create
    product = Product.find_by(id: params[:product_id])
    Image.create(
      link: params["link"],
      product_id: product.id
    )
    redirect_to "/products/#{product.id}"
  end
end
