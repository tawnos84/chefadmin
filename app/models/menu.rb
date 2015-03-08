class Menu < ActiveRecord::Base
  belongs_to :chef
  has_many :courses, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true

  def create
    menu = Menu.new(menu_params)

    menu.save
    redirect_to @menu
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
