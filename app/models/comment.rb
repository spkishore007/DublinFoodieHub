class Comment < ApplicationRecord
  belongs_to :product
  validates :comment, :rating, presence: true
end