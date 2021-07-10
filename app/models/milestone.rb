class Milestone < ApplicationRecord
  belongs_to :goal
  has_many :postthreads, dependent: :destroy
  has_one_attached :photo
  validates :model_overview, length: { maximum: 2000,
                                       too_long: '%{count} characters is the maximum allowed' }
  validates :photo, presence: true
end
