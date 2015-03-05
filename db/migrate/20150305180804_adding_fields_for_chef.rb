class AddingFieldsForChef < ActiveRecord::Migration
  def change
    add_column :chefs, :picture, :string
    add_column :chefs, :video, :string
    add_column :chefs, :family_dinner, :boolean
    add_column :chefs, :informal_reunion, :boolean
    add_column :chefs, :number_of_helpers, :integer
    add_column :chefs, :last_minute, :boolean
    add_column :chefs, :teaching, :boolean
    add_column :chefs, :min_size, :integer
    add_column :chefs, :max_size, :integer
    add_column :chefs, :facebook, :string

    change_column :chefs, :age, :integer

  end
end
