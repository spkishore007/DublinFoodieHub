require 'test_helper'

class StoreDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_detail = store_details(:one)
  end

  test "should get index" do
    get store_details_path
    assert_response :success
  end

  test "should get new" do
    get new_store_detail_url
    assert_response :success
  end

  test "should create store_detail" do
    assert_difference('StoreDetail.count') do
      post store_details_url, params: { store_detail: { building: @store_detail.building, city: @store_detail.city, pincode: @store_detail.pincode, storeEmail: @store_detail.store_email, storeMobile: @store_detail.store_mobile, storeName: @store_detail.store_name, street: @store_detail.street } }
    end

    assert_redirected_to store_detail_url(StoreDetail.last)
  end

  test "should show store_detail" do
    get store_detail_url(@store_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_detail_url(@store_detail)
    assert_response :success
  end

  test "should update store_detail" do
    patch store_detail_url(@store_detail), params: { store_detail: { building: @store_detail.building, city: @store_detail.city, pincode: @store_detail.pincode, storeEmail: @store_detail.storeEmail, storeMobile: @store_detail.storeMobile, storeName: @store_detail.storeName, street: @store_detail.street } }
    assert_redirected_to store_detail_url(@store_detail)
  end

  test "should destroy store_detail" do
    assert_difference('StoreDetail.count', -1) do
      delete store_detail_url(@store_detail)
    end

    assert_redirected_to store_details_url
  end
end

