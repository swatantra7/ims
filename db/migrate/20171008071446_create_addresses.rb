class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :address
      t.string :mobile_number
      t.string :email_id
      t.string :resource_type
      t.string :resource_id
      t.timestamps
    end
  end
end
