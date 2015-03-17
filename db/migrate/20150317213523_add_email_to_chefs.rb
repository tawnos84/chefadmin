class AddEmailToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :email, :string
  end
end
