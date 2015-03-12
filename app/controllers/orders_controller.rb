class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  private
  def order_params
      params.require(:order).permit(
          :menu_id, :no_of_guests, :name, :email, :phone, :street, :city, :postalcode, :country, :remarks_sibaritas, :remarks_chef,
          :net_price, :vat_amount)
  end
end
