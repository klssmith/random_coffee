class AddDeviseToUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname,           null: false
      t.string :lastname,            null: false
      t.string :image
      t.string :email,               null: false
      t.timestamps                   null: false
    end

    add_index :users, :email,                unique: true
  end
end
