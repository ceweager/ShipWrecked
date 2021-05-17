class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.string :milestone_name
      t.text :model_overview
      t.references :goal, null: false, foreign_key: true
      t.string :milestone_pic_url

      t.timestamps
    end
  end
end
