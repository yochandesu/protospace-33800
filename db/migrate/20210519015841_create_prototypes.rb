class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title
      t.text :catch_copy, foreign_key: true
      t.text :concept, foreign_key: true
      t.timestamps
      t.references :user_id, foreign_key: true
    end
  end
end
