class AddEventRefToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :event, index: true
  end
end
