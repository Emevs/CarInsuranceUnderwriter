class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
