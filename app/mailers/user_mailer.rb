class UserMailer < ApplicationMailer
  default from: "no-reply@losibaritas.com"
  layout 'mailer'

  def order_mail(email, menu_id, order_id)
    @menu = Menu.find(menu_id)
    @order = Order.find(order_id)
    mail(to: email, subject: 'Thank you for your order at LoSibaritas.com')
  end

  def chef_mail(email, menu_id, order_id)
    @menu = Menu.find(menu_id)
    @order = Order.find(order_id)
    mail(to: @menu.chef.email, subject: 'Congratulations - You have a new customer', template_name: 'order_chef_mail')
  end

  def account_activation(user)
    @user = user
    mail(to: user.email, subject: "Account activation")
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
