class AddPicColumnToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :character_pic, :string
  end
end
