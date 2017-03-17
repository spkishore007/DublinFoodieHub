require 'test_helper'

class Administrator::ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrator_application_index_url
    assert_response :success
  end

end
