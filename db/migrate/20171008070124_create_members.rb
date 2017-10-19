class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.decimal :fees
      t.timestamps
    end
  end
end
