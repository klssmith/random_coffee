class AddUserRefToMembers < ActiveRecord::Migration[5.1]
  def change
    add_reference :members, :user, index: true, foreign_key: true
  end
end
