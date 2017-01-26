class SuppliersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @suppliers = Supplier.all
  end
end
