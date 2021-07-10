class Relationship < ApplicationRecord
  belongs_to :character
  has_many :connects, dependent: :destroy
  has_many :postthreads, through: :connects
  validates :photo, presence: true
  has_one_attached :photo
end
