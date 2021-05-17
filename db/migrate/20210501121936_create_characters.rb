class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :birthday
      t.string :sexuality
      t.text :positive
      t.text :negative
      t.text :personality
      t.text :history
      t.text :other
      t.text :overview

      t.timestamps
    end
  end
end
