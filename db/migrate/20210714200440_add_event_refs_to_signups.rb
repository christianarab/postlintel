class AddEventRefsToSignups < ActiveRecord::Migration[6.1]
  def change
    add_reference :signups, :event, null: false, foreign_key: true, unique: true, on_delete: :cascade
  end
end
