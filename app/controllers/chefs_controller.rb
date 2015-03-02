class ChefsController < ApplicationController
  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def new
    @chef = Chef.new
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:id])

    if @chef.update(chef_params)
      redirect_to @chef
    else
      render 'edit'
    end
  end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      redirect_to @chef
    else
      render 'new'
    end
  end

  def destroy
    @chef = Chef.find(params[:id])
    @chef.destroy

    redirect_to chefs_path
  end

  private
  def chef_params
    params.require(:chef).permit(:name, :age, :location, :styles)
  end
end
