require 'test_helper'

class AddonTest < ActiveSupport::TestCase
  
test "should not save addon without name" do
  addon = Addon.new
  #var a=addOn.save
  assert_not addon.save, "saved the record without details"
end

end
