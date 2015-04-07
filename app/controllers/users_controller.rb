class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      @chef = Chef.new do |c|
        c.name = @user.name
        c.email = @user.email
        c.picture = "https://s3-sa-east-1.amazonaws.com/losibaritas/placeholder.png"
        c.save
      end

      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to searches_ask_url
    else
      render 'new'
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
