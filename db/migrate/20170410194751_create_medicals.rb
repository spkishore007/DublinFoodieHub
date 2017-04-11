class CreateMedicals < ActiveRecord::Migration[5.1]
  def change
    create_table :medicals do |t|
      t.string :userName
      t.integer :age
      t.string :medicalCondition
      t.string :disease
      t.string :allergens
      t.integer :mobile
      t.string :idProof
      t.date :causedTime
      t.string :foodHabit

      t.timestamps
    end
  end
end
