class CreateAttendance < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :event, null: false, foreign_key: true
      t.boolean :attending?
      t.timestamps
    end
  end
end
