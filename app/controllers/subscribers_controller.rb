class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    @subscriber.save
    if(@subscriber.clienttype == "customer")
      redirect_to root_path
    end
    if(@subscriber.clienttype == "chef")
      flash[:success] = "Gracias por registrarte!"
      redirect_to cheflanding_path
    end
  end

  private
  def subscriber_params
    params.require(:subscriber).permit(:email, :clienttype)
  end

end
