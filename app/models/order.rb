class Order < ActiveRecord::Base
#  validates :name, presence: true

  validates :no_of_guests, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :postalcode, presence: true
  validates :country, presence: true

  def create
    order = Order.new(order_params)

    order.save
    redirect_to @order
  end

  private
  def order_params
    params.require(:order).permit(
        :menu_id, :no_of_guests, :name, :email, :phone, :street, :city, :postalcode, :country, :remarks_sibaritas, :remarks_chef,
        :net_price, :vat_amount, :currency)
  end
end
