class AddPartnerToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :partner_id, :string
  end
end
