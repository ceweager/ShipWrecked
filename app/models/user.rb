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
  after_create :add_default_avatar
  include PgSearch::Model
  pg_search_scope :search_by_username,
                  against: [:username],
                  using: {
                    tsearch: { prefix: true }
                  }

  def invite?(user)
    friendship_invites.find_by(friend_id: user) || friendship_invites.find_by(user: user)
  end

  def friends
    FriendshipInvite.where('cast(friend_id as text) ILIKE :query OR cast(user_id as text) ILIKE :query',
                           query: id.to_s).where(friend_confirm: true)
  end

  private

  def set_admin_to_false
    self.admin = false
    save
  end

  def add_default_avatar
    unless photo.attached?
      photo.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_pic.jpg'
          )
        ), filename: 'default_pic.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
