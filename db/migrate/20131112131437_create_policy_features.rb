class CreatePolicyFeatures < ActiveRecord::Migration
  def change
    create_table :policy_features do |t|
      t.references :vehicle, index: true
      t.integer :policy_excess, null: false
      t.string :breakdown_cover, null: false
      t.string :windscreen_repair, null: false
      t.integer :windscreen_excess

      t.timestamps
    end
  end
end
