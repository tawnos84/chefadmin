class OrdersController < ApplicationController
  layout "admin", only: [:index]

  def index
    @orders = Order.all.paginate(page: params[:page], :per_page => 20).order(:created_at).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @menu = Menu.find(@order.menu_id)
  end

  def new
    @order = Order.new
    @menu = Menu.find(params[:menu_id])
    @order.order_type = params[:type]

    if @order.order_type == 'event'
      @event = Event.find(params[:event_id])
    end
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

    @order.order_type = params[:type]
    if @order.order_type == 'event'
      @event = Event.find(params[:event_id])
    end

    @menu = Menu.find(params[:menu_id])
    @order.net_price = @order.no_of_guests * @menu.price
    @order.currency = @menu.currency
    @order.vat_amount = @order.net_price * 0.18
    @order.menu_id = @menu.id
    @order.chef_id = @menu.chef_id

    if @order.save
      UserMailer.order_request_mail(@order.email, @menu.id, @order.id, params[:locale]).deliver_now!
      UserMailer.order_chef_action_mail(@order.email, @menu.id, @order.id).deliver_now!
      redirect_to new_charge_path(:order_id => @order.id)
    else
      render 'new'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  #view all pending orders
  def pending
    @chef = Chef.find_by_email(current_user.email)
    @orders = Order.all.where(:chef_id => @chef.id).where(:status => 'PENDING').paginate(page: params[:page], :per_page => 20).order(:created_at).reverse_order
  end

  #view all orders of one chef
  def overview
    @chef = Chef.find_by_email(current_user.email)
    @orders = Order.all.where(:chef_id => @chef.id).paginate(page: params[:page], :per_page => 20).order(:created_at).reverse_order
  end

  #accept an order
  def accept
    @order = Order.find(params[:orderid])
    @order.update(:status => 'ACCEPTED')
    UserMailer.order_mail(@order.email, @order.menu_id, @order.id).deliver!
    UserMailer.chef_mail(@order.email, @order.menu_id, @order.id).deliver!
    flash[:success] = "Order accepted"
    redirect_to pending_path
  end

  #decline an order
  def decline
    @order = Order.find(params[:orderid])
    @order.update(:status => 'DECLINED')
    UserMailer.order_reject_mail(@order.email, @order.menu_id, @order.id).deliver!
    flash[:danger] = "Order declined"
    redirect_to pending_path
  end

  private
  def order_params
      params.require(:order).permit(
          :menu_id, :no_of_guests, :name, :email, :phone, :street, :city, :postalcode, :country, :remarks_sibaritas, :remarks_chef,
          :net_price, :vat_amount, :currency, :cook_date, :cook_time, :cook_location, :order_type, :type, :event_id)
  end
end
