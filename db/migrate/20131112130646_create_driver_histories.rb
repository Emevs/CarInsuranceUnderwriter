class CreateDriverHistories < ActiveRecord::Migration
  def change
    create_table :driver_histories do |t|
      t.references :user, index: true
      t.integer :number_of_incidents, null: false

      t.timestamps
    end
  end
end
