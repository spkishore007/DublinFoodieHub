class AddMoreTablesToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :user_name, :string
    add_column :members, :login_Count, :integer
    add_column :members, :building, :string
    add_column :members, :street, :string
    add_column :members, :city, :string
    add_column :members, :pincode, :string
    add_column :members, :mobile, :integer
    add_column :members, :date_0f_Birth, :date
    add_column :members, :id_proof, :string
  end
end
