class Chef < ActiveRecord::Base
  validates :name, presence: true
  validates :styles, presence: true

  def create
    chef = Chef.new(article_params)

    chef.save
    redirect_to @chef
  end

  private
  def article_params
    params.require(:chef).permit(:name, :age, :location, :styles)
  end
end
