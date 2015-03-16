class WelcomeController < ApplicationController
  def index
    @chefs = Chef.all
    @menus = Menu.all
    @courses = Course.all
    @orders = Order.all
  end
end
