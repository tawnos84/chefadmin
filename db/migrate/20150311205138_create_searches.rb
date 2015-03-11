class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.date :cook_date

      t.time :cook_time

      t.string :cook_location


      t.timestamps null: false
    end
  end
end
