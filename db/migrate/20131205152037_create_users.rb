class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :password
      t.Person :references

      t.timestamps
    end
  end
end
