class AddEmailToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :email, :string
    add_index :members, :email, unique: true
  end
end
