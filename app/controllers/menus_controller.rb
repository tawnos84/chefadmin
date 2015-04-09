class MenusController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @menus = @chef.menus.all
  end

  def new
    @menu = Menu.new
    @chef = Chef.find_by_email(current_user.email)
  end

  def edit
    @chef = Chef.find(params[:chef_id])
    @menu = @chef.menus.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:chef_id])
    @menu = @chef.menus.find(params[:id])

    if @menu.update(menu_params)
      redirect_to chef_menus_url
    else
      render 'new'
    end
  end

  def create
    @chef = Chef.find(params[:chef_id])
    @menu = @chef.menus.create(menu_params)

    if @menu.save
      redirect_to chef_menus_url
    else
      render 'new'
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def destroy
    @chef = Chef.find(params[:chef_id])
    @menu = @chef.menus.find(params[:id])
    @menu.destroy

    redirect_to chef_menus_path(@chef)
  end

  private
  def menu_params
    params.require(:menu).permit(
        :name, :price, :chef_id,
        :currency,
        :description,
        :cuisine_italian,
        :cuisine_peruvian,
        :cuisine_mediterranean,
        :cuisine_spanish,
        :cuisine_american,
        :cuisine_japanese,
        :cuisine_fusion,
        :cuisine_thai,
        :cuisine_vietnamese,
        :cuisine_latinamerican,
        :cuisine_indian,
        :cuisine_persian,
        :cuisine_bbq,
        :cuisine_argentinian,
        :cuisine_anticuchos,
        :cuisine_patisserie,
        :cuisine_exotic,
        :cuisine_german,
        :cuisine_brazilian,
        :option_alcohol,
        :option_change,
        :hashtags,
        :partysize,
        :photo1,
        :photo2,
        :photo3,
        :photo4,
        :photo5
    )
  end
end
