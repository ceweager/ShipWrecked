class Postthread < ApplicationRecord
  belongs_to :milestone
  has_many :connects, dependent: :destroy
  has_many :relationships, through: :connects
  
end
