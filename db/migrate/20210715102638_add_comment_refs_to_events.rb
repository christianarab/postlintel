class AddCommentRefsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :event, null: false, foreign_key: true, on_delete: :cascade
  end
end