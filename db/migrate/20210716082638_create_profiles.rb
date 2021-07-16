class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :tagline
      t.text :interests
      t.references :user, null: false, foreign_key: true, unique: true, on_delete: :cascade

      t.timestamps
    end
  end
end
