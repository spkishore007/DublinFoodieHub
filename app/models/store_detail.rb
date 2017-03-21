class StoreDetail < ApplicationRecord
    belongs_to :member, class_name: "Member", foreign_key: "member_id"
    has_many :products
    has_many :addons
      def self.policy_class
    StoreDetailPolicy
      end
    
end
