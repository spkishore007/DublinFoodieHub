class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :rating
      t.references :food, foreign_key: true

      t.timestamps
    end
  end
end
