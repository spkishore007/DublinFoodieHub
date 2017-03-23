class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :store_detail
  has_many :comments,dependent: :destroy

  default_scope { where(active: true) }
end
