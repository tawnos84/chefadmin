class Menu < ActiveRecord::Base
  belongs_to :chef

  validates :name, presence: true
  validates :price, presence: true

  def create
    menu = Menu.new(menu_params)

    menu.save
    redirect_to @menu
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :price, :chef_id)
  end
end
