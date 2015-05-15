class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :chef
      t.string :menu
      t.string :date
      t.string :location
      t.string :price
      t.string :persons

      t.timestamps null: false
    end
  end
end
