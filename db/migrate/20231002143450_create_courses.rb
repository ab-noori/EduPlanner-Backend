class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :fee
      t.date :startDate

      t.timestamps
    end
  end
end
