class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(
      username: params["username"],
      email: params["email"],
      password: params["password"]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Account created successfully!"
      redirect_to "/products"
    else
      flash[:warning] = "Invalid email or password!"
      redirect_to '/signup'
    end
  end
end
