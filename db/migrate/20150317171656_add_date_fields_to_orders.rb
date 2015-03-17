class AddDateFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cook_date, :date
    add_column :orders, :cook_time, :time
    add_column :orders, :cook_location, :string
  end
end
