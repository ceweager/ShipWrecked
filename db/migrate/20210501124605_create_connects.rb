class CreateConnects < ActiveRecord::Migration[6.0]
  def change
    create_table :connects do |t|
      t.references :relationship, null: false, foreign_key: true
      t.references :postthread, null: false, foreign_key: true

      t.timestamps
    end
  end
end
