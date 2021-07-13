class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.string :user_id
      t.text :body

      t.timestamps
    end
  end
end
