class Profile < ApplicationRecord
  belongs_to :member
  attr_accessor :firstName, :lastName, :building, :street, :city, :pincode, :mobile, :dateOfBirth, :email, :idProof
  validates :firstName, :lastName, :building, :street, :city, :pincode, :dateOfBirth, :email, presence: true
  validates :idProof, uniqueness: true, presence: true
  validates :mobile, uniqueness: true, presence: true
   
end
