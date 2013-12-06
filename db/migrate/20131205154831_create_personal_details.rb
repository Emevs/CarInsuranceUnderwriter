class CreatePeople < ActiveRecord::Migration
  def change
    create_table :personal_details do |t|
      t.string :title
      t.string :forenames
      t.string :surname
      t.string :email
      t.date :date_of_birth
      t.string :telephone_number
      t.string :license_type
      t.string :license_period
      t.string :occupation
      t.references :user, index: true
      t.timestamps
    end
  end
end
