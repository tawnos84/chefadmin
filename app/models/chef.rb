class Chef < ActiveRecord::Base
  has_many :menus, dependent: :destroy

  validates :name, presence: true
  validates :styles, presence: true

  def create
    chef = Chef.new(chef_params)

    chef.save
    redirect_to @chef
  end

  private
  def chef_params
    params.require(:chef).permit(:name, :age, :location, :styles)
  end
end
