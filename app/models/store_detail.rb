class StoreDetail < ApplicationRecord
    belongs_to :member, class_name: "Member", foreign_key: "member_id"
    has_many :products,dependent: :destroy
    has_many :addons,dependent: :destroy
   def self.policy_class
      StoreDetailPolicy
   end
end
