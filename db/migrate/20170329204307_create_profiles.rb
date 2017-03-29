class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :firstName
      t.string :lastName
      t.string :building
      t.string :street
      t.string :city
      t.integer :pincode
      t.integer :mobile
      t.date :dateOfBirth
      t.string :email
      t.string :idProof
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
