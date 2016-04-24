class AddEventtypeToMenus < ActiveRecord::Migration
  def change
      add_column :menus, :eventtype, :string
  end
end
