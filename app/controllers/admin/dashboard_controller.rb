class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV["ADMIN_USER"], password: ENV["ADMIN_PW"]

  def show
    @products_total = Product.count
    @categories_total = Category.count

    # raise @categories_total.inspect
  end
end
