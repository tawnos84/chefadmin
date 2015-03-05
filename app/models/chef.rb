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
    params.require(:chef).permit(:name, :age, :location, :styles, :biography, :culinarytraining, :picture, :video, :family_dinner,
                                 :informal_reunion, :number_of_helpers, :last_minute, :teaching, :min_size, :max_size, :facebook)
  end
end
