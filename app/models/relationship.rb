class Relationship < ApplicationRecord
  belongs_to :character
  has_many :connects, dependent: :destroy
  has_many :postthreads, through: :connects  
end
