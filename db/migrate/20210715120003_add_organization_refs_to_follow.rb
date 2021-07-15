class AddOrganizationRefsToFollow < ActiveRecord::Migration[6.1]
  def change
    add_reference :follows, :organization, null: false, foreign_key: true
    add_reference :follows, :user, index: true
  end
end
