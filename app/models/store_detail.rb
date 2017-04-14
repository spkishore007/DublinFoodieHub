class StoreDetail < ApplicationRecord
    belongs_to :member, class_name: "Member", foreign_key: "member_id"
    has_many :products,dependent: :destroy
    has_many :addons,dependent: :destroy
    attr_accessor :store_name, :building, :street, :city, :pincode, :store_mobile, :store_email
    validates :store_name, :building, :street, :city, :pincode, :store_mobile, :store_email, presence: true

   def self.policy_class
      StoreDetailPolicy
   end
end
