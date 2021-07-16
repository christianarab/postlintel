class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :likeable_id
      t.string :likeable_type
      t.string :user_id

      t.timestamps
    end
  end
end
