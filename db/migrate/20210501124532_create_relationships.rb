class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.string :relation_name
      t.string :relation_status
      t.text :relation_detail
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
