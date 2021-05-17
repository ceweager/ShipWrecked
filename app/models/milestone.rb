class Milestone < ApplicationRecord
  belongs_to :goal
  has_many :postthreads, dependent: :destroy
  validates :model_overview, length: {maximum: 2000,
    too_long: "%{count} characters is the maximum allowed" }
end
