class UserMailer < ApplicationMailer
  default from: "no-reply@losibaritas.com"
  layout 'mailer'

  #Order Confirmation to Customer
  def order_mail(email, menu_id, order_id)
    @menu = Menu.find(menu_id)
    @order = Order.find(order_id)
    mail(to: email, subject: 'Order confirmation', template_name: 'order_mail')
  end

  #Order Confirmation to Chef
  def chef_mail(email, menu_id, order_id)
    @menu = Menu.find(menu_id)
    @order = Order.find(order_id)
    mail(to: @menu.chef.email, subject: 'Congratulations - You have a new customer', template_name: 'order_chef_mail')
  end

  #Order Request Confirmation to Customer
  def order_reject_mail(email, menu_id, order_id)
    @menu = Menu.find(menu_id)
    @order = Order.find(order_id)
    mail(to: email, subject: 'Unfortunately the chef is already busy', template_name: 'order_reject_mail')
  end

  #Order Request Confirmation to Customer
  def order_request_mail(email, menu_id, order_id, language)
    @menu = Menu.find(menu_id)
    @order = Order.find(order_id)

    if language=='en'
    mail(to: email, subject: 'Thank you for your order at LoSibaritas.com', template_name: 'order_request_mail')
    end

    if language=='es'
      mail(to: email, subject: 'Muchas gracias por tu pedido con LoSibaritas.com', template_name: 'order_request_mail_es')
    end

  end

  #Order Request Call to Action to Chef
  def order_chef_action_mail(email, menu_id, order_id)
    @menu = Menu.find(menu_id)
    @order = Order.find(order_id)
    mail(to: @menu.chef.email, subject: 'Customer Request: Dinner request', template_name: 'order_chef_action_mail')
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
