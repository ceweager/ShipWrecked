class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :pronouns, :string
    add_column :users, :timezone, :string
    add_column :users, :about, :text
  end
end
