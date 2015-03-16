class UserMailer < ApplicationMailer
  default from: "no-reply@losibaritas.com"
  layout 'mailer'

  def order_mail(email, menu_id, order_id)
    @menu = Menu.find(menu_id)
    @order = Order.find(order_id)
    mail(to: email, subject: 'Thank you for your order at LoSibaritas.com')
  end
end
