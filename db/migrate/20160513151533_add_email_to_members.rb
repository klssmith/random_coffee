class AddEmailToMembers < ActiveRecord::Migration
  def change
    add_column :members, :email, :string
    add_index :members, :email, unique: true
  end
end
