class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps null: false
    end
  end
end
