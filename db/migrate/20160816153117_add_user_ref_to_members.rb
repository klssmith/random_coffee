class AddUserRefToMembers < ActiveRecord::Migration
  def change
    add_reference :members, :user, index: true, foreign_key: true
  end
end
