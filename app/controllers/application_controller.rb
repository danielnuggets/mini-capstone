class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_carted_products
    current_user.carted_products.where(status: "carted")
  end
  helper_method :user_carted_products

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def authenticate_admin!
    redirect_to '/products' unless current_user && current_user.admin
  end
end
