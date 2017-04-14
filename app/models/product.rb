class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :store_detail
  has_many :comments,dependent: :destroy
  validates :name, :quantityAvailable, :allergens, :description, presence: true
  validates :price, :active, :foodType, :foodSize, :calorie, presence: true
  validates :offerPrice, presence: true
  attr_accessor :name, :price, :offerPrice
  serialize :tapping
  default_scope { where(active: true) }
  def self.policy_class
      ProductPolicy
  end
end
