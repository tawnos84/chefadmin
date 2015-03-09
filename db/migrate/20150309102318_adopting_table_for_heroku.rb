class AdoptingTableForHeroku < ActiveRecord::Migration
  def change
    rename_column :chefs, :age, :age_string
    add_column :chefs, :age, :integer


    rename_column :menus, :price, :price_string
    add_column :menus, :price, :integer
  end
end
