class AddStatusToLike < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :status, :boolean
    add_reference :likes, :user, index: true, unique: true
  end
end
