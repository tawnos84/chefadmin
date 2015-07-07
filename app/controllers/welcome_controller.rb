class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "borussia", only: :admin
  layout "admin"

  def index
    @chef = Chef.find_by_email(current_user.email)
    @menus = @chef.menus.all
    @orders = Order.all.where(:chef_id => @chef.id)

  end

  def admin
    @chefs = Chef.all.paginate(page: params[:cpage], :per_page => 5).order(:created_at).reverse_order
    @menus = Menu.all
    @courses = Course.all
    @events = Event.all
    @orders = Order.all.paginate(page: params[:page], :per_page => 5).order(:created_at).reverse_order
  end
end
