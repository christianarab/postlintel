class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.integer :user_id, unique: true

      t.timestamps
    end
  end
end
