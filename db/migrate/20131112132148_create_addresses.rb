class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, index: true
      t.string :house_name_or_number, null: false
      t.string :street_name, null: false
      t.string :county, null: false
      t.string :city, null: false
      t.string :postcode, null: false

      t.timestamps
    end
  end
end
