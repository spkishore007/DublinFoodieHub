class Member < ApplicationRecord
  has_many :established_stores,class_name:"StoreDetail",dependent: :destroy
  has_one :profile,dependent: :destroy
  has_many :clicks

  # Include default devise modules. Others available are:
  # :confirmable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,:timeoutable,password_length: 9..128
         
   validate :strong_password_check
   validates :email, uniqueness: true, presence: true
   #validates :user_name, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/ }

  def strong_password_check
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
    errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end
end
