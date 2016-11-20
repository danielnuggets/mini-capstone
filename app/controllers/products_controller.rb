class ProductsController < ApplicationController
  def index
    if params["sort_attribute"] && params["order"]
      @products = Product.order(params["sort_attribute"] => params["order"])
    elsif params["discount"] == "true"
      @products = Product.where("price < ?", 2.00)
    elsif params["search"]
      @products = Product.where("name LIKE ?", "%#{params["search"]}%")
    else
      @products = Product.all
    end
    render 'index.html.erb'
  end

  def show
    if params["id"] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params["id"])
    end
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    product = Product.new(
      name: params["name"], 
      price: params["price"], 
      image: params["image"], 
      description: params["description"],
      stock: params["stock"]
    )
    product.save
    flash[:success] = "New product created!"
    redirect_to "/products/#{product.id}"

  end

  def edit
    @product = Product.find_by(id: params["id"])
    render 'edit.html.erb'
  end

  def update
    product = Product.find_by(id: params["id"])
    product.update(name: params["name"], price: params["price"], image: params["image"], description: params["description"], stock: params["stock"])
    flash[:info] = "Product updated!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params["id"])
    flash[:danger] = "#{product.name} deleted!"
    product.destroy
    redirect_to "/products"
  end
end
