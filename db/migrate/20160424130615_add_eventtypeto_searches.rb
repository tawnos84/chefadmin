class AddEventtypetoSearches < ActiveRecord::Migration
  def change
    add_column :searches, :event_type, :string
  end
end
