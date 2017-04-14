require 'test_helper'

class AddonTest < ActiveSupport::TestCase
  
test "should not save addon without name" do
  addOn = Addon.new
  addOn.addonName="uyyy"
  addOn.addonType="uii"
  addOn.addonPrice=1
  assert_equal(false,addOn.save)
end

end
