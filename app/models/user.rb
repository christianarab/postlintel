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
  has_many :events, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  validates :profile_photo, :presence => true

  def profile_thumbnail
    if profile_photo.attached?
      profile_photo.variant(resize: '100x100!').processed
    end
  end

  def self.signuped_events(id)
    @signups = []
    User.find(id).signups.each do |item|
      @signups << item.event
    end
    @signups
  end
end
