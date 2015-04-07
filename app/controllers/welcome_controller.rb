class WelcomeController < ApplicationController

  def index
    @chef = Chef.find_by_email(current_user.email)
    @menus = @chef.menus.all
    @orders = Order.all
  end

  def admin
    @chefs = Chef.all
    @menus = Menu.all
    @courses = Course.all
    @orders = Order.all
  end
end
