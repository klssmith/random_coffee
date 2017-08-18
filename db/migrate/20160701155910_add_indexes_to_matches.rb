class AddIndexesToMatches < ActiveRecord::Migration[5.1]
  def change
    add_index :matches, :member1_id
    add_index :matches, :member2_id
  end
end
