class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :member1_id
      t.integer :member2_id

      t.timestamps null: false
    end
  end
end
