class Food < ApplicationRecord
  belongs_to :store_detail
  has_many :comments
end
