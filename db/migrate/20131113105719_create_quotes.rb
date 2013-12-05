class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.references :vehicle, index: true
      t.string :quote_reference
      t.integer :amount

      t.timestamps
    end
  end
end
