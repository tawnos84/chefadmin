class AddChefIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :chefid, :string
  end
end
