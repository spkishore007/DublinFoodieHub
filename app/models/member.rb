class Member < ApplicationRecord
  has_many :established_stores,class_name:"StoreDetail",dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, password_length: 9..128
         
   validate :strong_password_check
   
   validates :user_name, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/ }

  def strong_password_check
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
      errors.add "Your password must include at least one digit, one lowercase and uppercase letter"
    end
  end
end
