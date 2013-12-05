class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.references :driver_history, index: true
      t.date :date_of_incident
      t.integer :claim_value
      t.string :incident_type
      t.string :description
      t.timestamps
    end
  end
end
