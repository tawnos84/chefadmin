class AddStatusToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :active, :boolean, default: true
  end
end
