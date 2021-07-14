class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :organizations
  has_many :events
  has_many :attended_events, through: :events, source: :events
  has_many :comments, as: :commentable
end
