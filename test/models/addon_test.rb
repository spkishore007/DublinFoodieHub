require 'test_helper'

class AddonTest < ActiveSupport::TestCase
  
test "should not save addon without name" do
  addOn = Addon.new
var a=addOn.save
  assert_equal(false,addOn.save)
end

end
