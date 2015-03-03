class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :position
      t.string :type
      t.text :description
      t.references :menu, index: true

      t.timestamps null: false
    end
    add_foreign_key :courses, :menus
  end
end
