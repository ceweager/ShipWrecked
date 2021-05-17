class Goal < ApplicationRecord
  belongs_to :character
  has_many :milestones, dependent: :destroy
  has_many :postthreads, through: :milestones, dependent: :destroy
end
