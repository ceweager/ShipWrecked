class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :characters
  has_many :relationships, through: :characters
  has_many :friendship_invites
  has_many :friends, through: :friendship_invites
  has_many :friend_invites_as_friend, foreign_key: :friend_id, class_name: :FriendshipInvite

  include PgSearch::Model
  pg_search_scope :search_by_username,
                  against: [:username],
                  using: {
                    tsearch: { prefix: true }
                  }
end
