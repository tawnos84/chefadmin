class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    session[:admin] = true
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
    @user = User.find(current_user.id)
    @chef = Chef.find_by_email(current_user.email)
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_details_params)
      redirect_to welcome_index_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,)
  end

  def user_details_params
    params.require(:user).permit(:company, :addressline1, :addressline2, :postalcode, :city, :country)
  end
end
