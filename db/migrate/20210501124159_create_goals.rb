class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.references :character, null: false, foreign_key: true
      t.string :goal_name
      t.text :goal_detail

      t.timestamps
    end
  end
end
