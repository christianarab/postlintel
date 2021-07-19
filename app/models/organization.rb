class Organization < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :follows
  has_one_attached :org_photo
  validates :org_photo, presence: true

  def org_thumbnail
    if org_photo.attached?
      org_photo.variant(resize: '100x100!').processed
    end
  end

  def followed?(user)
    puts "This is the user ID: #{user.id}"
    # return false unless self.signups.include?(user.id)
    follow = follows.find { | follow | follow.user_id == user.id } 
    if follow.nil?
      false
    else
      true
    end
  end
end
