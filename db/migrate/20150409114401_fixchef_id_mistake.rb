class FixchefIdMistake < ActiveRecord::Migration
  def change
    add_column :orders, :chef_id, :string
  end
end
