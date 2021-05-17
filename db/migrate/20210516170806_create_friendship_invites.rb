class CreateFriendshipInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :friendship_invites do |t|
      t.integer :friend_id
      t.references :user, null: false, foreign_key: true
      t.boolean :user_confirm
      t.boolean :friend_confirm

      t.timestamps
    end
  end
end
