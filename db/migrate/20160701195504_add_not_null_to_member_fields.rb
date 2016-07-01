class AddNotNullToMemberFields < ActiveRecord::Migration
  def change
    change_column_null :members, :firstname, false
    change_column_null :members, :lastname, false
    change_column_null :members, :email, false
  end
end
