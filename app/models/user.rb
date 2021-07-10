class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :characters, dependent: :destroy
  has_many :relationships, through: :characters, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :postthreads, through: :characters, dependent: :destroy
  has_many :friendship_invites, dependent: :destroy
  has_many :friends, through: :friendship_invites, dependent: :destroy
  has_many :friend_invites_as_friend, foreign_key: :friend_id, class_name: :FriendshipInvite
  has_one_attached :photo
  after_create :set_admin_to_false
  include PgSearch::Model
  pg_search_scope :search_by_username,
                  against: [:username],
                  using: {
                    tsearch: { prefix: true }
                  }

  def invite?(user)
    friendship_invites.find_by(friend_id: user) || friendship_invites.find_by(user: user)
  end

  private

  def set_admin_to_false
    self.admin = false
    save
  end
end
