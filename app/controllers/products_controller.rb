class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params["sort_attribute"] && params["order"]
      @products = Product.order(params["sort_attribute"] => params["order"])
    elsif params["discount"] == "true"
      @products = Product.where("price < ?", 2.00)
    elsif params["search"]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    elsif params[:category_id]
      @products = Category.find_by(id: params[:category_id]).products
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
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(
      name: params["name"], 
      price: params["price"], 
      description: params["description"],
      stock: params["stock"],
      supplier_id: params["Supplier"]["supplier_id"]
    )

    if @product.save
      flash[:success] = "New product created!"
      redirect_to "/products/#{@product.id}"
    else
      render 'new.html.erb'
    end

  end

  def edit
    @product = Product.find_by(id: params["id"])
    render 'edit.html.erb'
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.assign_attributes(
      name: params["name"], 
      price: params["price"], 
      description: params["description"], 
      stock: params["stock"], 
      supplier_id: params["Supplier"]["supplier_id"]
      )

    if @product.save
      flash[:info] = "Product updated!"
      redirect_to "/products/#{@product.id}"
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    flash[:danger] = "#{product.name} deleted!"
    product.destroy
    redirect_to "/products"
  end
end
