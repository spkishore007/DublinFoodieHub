class Addon < ApplicationRecord
  belongs_to :store_detail
  validates :addonName, presence: true
  validates :addonPrice, presence: true
end
