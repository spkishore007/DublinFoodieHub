class ProductObserver < ActiveRecord::Observer
  observe :product
  def after_create(record)
   # do some stuff
   # ......
   # do some stuff
  end
end