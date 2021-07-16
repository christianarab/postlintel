class AddOrganizationRefToFollows < ActiveRecord::Migration[6.1]
  def change
    add_reference :follows, :organizations, null: false, foreign_key: true
    add_reference :follows, :user, index: true, unique: true
  end
end
