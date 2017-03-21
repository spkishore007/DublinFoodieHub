class Product < ApplicationRecord
  has_many :order_items
  belongs_to :store_detail
  has_many :comments

  default_scope { where(active: true) }
end
