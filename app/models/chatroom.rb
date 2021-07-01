class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user
  belongs_to :partner, foreign_key: :partner_id, class_name: :User
  validates :name, presence: true
end
