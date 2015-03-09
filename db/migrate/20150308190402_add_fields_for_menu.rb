class AddFieldsForMenu < ActiveRecord::Migration
  def change
    add_column :menus, :photo1, :string
    add_column :menus, :photo2, :string
    add_column :menus, :photo3, :string
    add_column :menus, :photo4, :string
    add_column :menus, :photo5, :string
    add_column :menus, :currency, :string
    add_column :menus, :description, :text
    add_column :menus, :cuisine_italian, :boolean
    add_column :menus, :cuisine_peruvian, :boolean
    add_column :menus, :cuisine_mediterranean, :boolean
    add_column :menus, :cuisine_spanish, :boolean
    add_column :menus, :cuisine_american, :boolean
    add_column :menus, :cuisine_japanese, :boolean
    add_column :menus, :cuisine_fusion, :boolean
    add_column :menus, :cuisine_thai, :boolean
    add_column :menus, :cuisine_vietnamese, :boolean
    add_column :menus, :cuisine_latinamerican, :boolean
    add_column :menus, :cuisine_indian, :boolean
    add_column :menus, :cuisine_persian, :boolean
    add_column :menus, :cuisine_bbq, :boolean
    add_column :menus, :cuisine_argentinian, :boolean
    add_column :menus, :cuisine_anticuchos, :boolean
    add_column :menus, :cuisine_patisserie, :boolean
    add_column :menus, :cuisine_exotic, :boolean
    add_column :menus, :cuisine_german, :boolean
    add_column :menus, :cuisine_brazilian, :boolean
    add_column :menus, :option_alcohol, :boolean
    add_column :menus, :option_change, :boolean
    add_column :menus, :hashtags, :boolean
    add_column :menus, :partysize, :boolean

  end
end
