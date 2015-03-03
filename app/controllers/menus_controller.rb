class MenusController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @menus = @chef.menus.all
  end

  def new
    @menu = Menu.new
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
    params.require(:menu).permit(:name, :price, :chef_id)
  end
end
