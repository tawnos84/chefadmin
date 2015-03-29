class AddSearchOptions < ActiveRecord::Migration
  def change
    add_column :searches, :max_price, :integer
    add_column :searches, :cuisine_type, :string
  end
end
