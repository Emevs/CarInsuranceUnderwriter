class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.references :user, index: true
      t.string :vehicle_registration, null: false
      t.integer :annual_mileage, null: false
      t.integer :estimated_value, null: false
      t.string :parking_location, null: false
      t.date :policy_start_date, null: false

      t.timestamps
    end
  end
end
