require 'test_helper'

class GraphControllerTest < ActionDispatch::IntegrationTest
  test "should get getdata" do
    get graph_getdata_url
    assert_response :success
  end

  test "should get showdata" do
    get graph_showdata_url
    assert_response :success
  end

end
