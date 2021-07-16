class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_one_attached :profile_photo
  has_many :organizations
  has_many :signups
  has_many :follows
  has_many :events
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  def profile_thumbnail
    if profile_photo.attached?
      profile_photo.variant(resize: '100x100!').processed
    end
  end
end
