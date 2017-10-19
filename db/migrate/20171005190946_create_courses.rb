class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, uniq: true
      t.integer :interval
      t.timestamps
    end
  end
end
