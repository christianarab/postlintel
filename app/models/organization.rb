class Organization < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :events, dependent: :delete_all
  has_many :follows
  has_one_attached :org_photo

  def org_thumbnail
    if org_photo.attached?
      org_photo.variant(resize: '100x100!').processed
    end
  end
end
