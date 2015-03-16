class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @menu = Menu.find(@order.menu_id)
  end

  def new
    @order = Order.new
    @menu = Menu.find(params[:menu_id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to @order
    else
      render 'edit'
    end
  end

  def create
    @order = Order.new(order_params)

    @menu = Menu.find(params[:menu_id])
    @order.net_price = @order.no_of_guests * @menu.price
    @order.currency = @menu.currency
    @order.vat_amount = @order.net_price * 0.18
    @order.menu_id = @menu.id

    if @order.save
      redirect_to @order
    else
      render 'new'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  private
  def order_params
      params.require(:order).permit(
          :menu_id, :no_of_guests, :name, :email, :phone, :street, :city, :postalcode, :country, :remarks_sibaritas, :remarks_chef,
          :net_price, :vat_amount, :currency)
  end
end
