class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  #validates :total_price, :unit_price, presence: true
  validate :any_product_present
  validate :any_order_present
  
  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def any_product_present
    if product.nil?
      errors.add :product,"is not valid or is not active.Sorry for the inconvience caused"
    end
  end

  def any_order_present
    if order.nil?
      errors.add :order, "is not a valid order.Sorry for the inconvience caused"
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
