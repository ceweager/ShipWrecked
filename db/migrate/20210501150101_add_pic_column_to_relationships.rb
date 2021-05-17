class AddPicColumnToRelationships < ActiveRecord::Migration[6.0]
  def change
    add_column :relationships, :relation_pic, :string
  end
end
