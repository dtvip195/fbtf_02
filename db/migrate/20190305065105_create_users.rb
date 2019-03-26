class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :phonenumber
      t.integer :role, default: 0, null: false

      t.timestamps
    end
  end
end
