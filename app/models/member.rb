class Member < ApplicationRecord
  has_many :established_stores,class_name:"StoreDetail",dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
end
