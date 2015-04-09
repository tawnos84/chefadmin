class AddAccountSettingsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company, :string
    add_column :users, :addressline1, :string
    add_column :users, :addressline2, :string
    add_column :users, :postalcode, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
  end
end
