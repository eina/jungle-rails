class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USER"], password: ENV["ADMIN_PW"]

  def index
  end

  def new
  end

  def create
  end 
end
