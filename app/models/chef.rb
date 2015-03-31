class Chef < ActiveRecord::Base
  has_many :menus, dependent: :destroy

  mount_uploader :picture, ChefPictureUploader

  validates :name, presence: true
  validates :email, presence: true

  def create
    chef = Chef.new(chef_params)

    chef.save
    redirect_to @chef
  end

  private
  def chef_params
    params.require(:chef).permit(:name, :email, :age, :location, :styles, :biography, :culinarytraining, :picture, :video, :family_dinner,
                                 :informal_reunion, :number_of_helpers, :last_minute, :teaching, :min_size, :max_size, :facebook)
  end
end
