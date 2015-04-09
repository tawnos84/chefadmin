class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "borussia", only: :admin

  def index
    @chef = Chef.find_by_email(current_user.email)
    @menus = @chef.menus.all
    @orders = Order.all.where(:chef_id => @chef.id)
  end

  def admin
    @chefs = Chef.all
    @menus = Menu.all
    @courses = Course.all
    @orders = Order.all
  end
end
