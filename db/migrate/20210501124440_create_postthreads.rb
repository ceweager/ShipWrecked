class CreatePostthreads < ActiveRecord::Migration[6.0]
  def change
    create_table :postthreads do |t|
      t.string :thread_name
      t.string :thread_status
      t.references :milestone, null: false, foreign_key: true
      t.text :thread_detail
      t.string :thread_link

      t.timestamps
    end
  end
end
