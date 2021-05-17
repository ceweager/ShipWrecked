class Connect < ApplicationRecord
  belongs_to :relationship
  belongs_to :postthread
  validates :relationship_id, uniqueness: { scope: :postthread_id }
end
