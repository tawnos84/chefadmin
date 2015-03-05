class AddFieldsToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :biography, :text
    add_column :chefs, :culinarytraining, :text
  end
end
