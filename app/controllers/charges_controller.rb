class ChargesController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @totalprice = @order.no_of_guests * @order.net_price
  end

  def create
    @order = Order.find(params[:order_id])
    # Amount in cents
    @amount = @order.no_of_guests * @order.net_price * 100

    customer = Stripe::Customer.create(
        :email => @order.email,
        :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount.to_i,
        :description => 'LoSibaritas.com',
        :currency    => @order.currency
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to orders_show_path(@order)
  end

end
