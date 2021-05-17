class FriendshipInvite < ApplicationRecord
  belongs_to :friend, foreign_key: :friend_id, class_name: :User
  belongs_to :user
end
