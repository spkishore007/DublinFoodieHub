require 'test_helper'

class AddonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addon = addons(:one)
  end

  test "should get index" do
    get addons_url
    assert_response :success
  end

  test "should get new" do
    get new_addon_url
    assert_response :success
  end

  test "should create addon" do
    assert_difference('Addon.count') do
      post addons_url, params: { addon: { addonName: @addon.addonName, addonPrice: @addon.addonPrice, addonType: @addon.addonType, hit: @addon.hit, storeDetail_id: @addon.storeDetail_id } }
    end

    assert_redirected_to addon_url(Addon.last)
  end

  test "should show addon" do
    get addon_url(@addon)
    assert_response :success
  end

  test "should get edit" do
    get edit_addon_url(@addon)
    assert_response :success
  end

  test "should update addon" do
    patch addon_url(@addon), params: { addon: { addonName: @addon.addonName, addonPrice: @addon.addonPrice, addonType: @addon.addonType, hit: @addon.hit, storeDetail_id: @addon.storeDetail_id } }
    assert_redirected_to addon_url(@addon)
  end

  test "should destroy addon" do
    assert_difference('Addon.count', -1) do
      delete addon_url(@addon)
    end

    assert_redirected_to addons_url
  end
end
