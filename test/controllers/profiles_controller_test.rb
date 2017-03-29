require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { building: @profile.building, city: @profile.city, dateOfBirth: @profile.dateOfBirth, email: @profile.email, firstName: @profile.firstName, idProof: @profile.idProof, lastName: @profile.lastName, member_id: @profile.member_id, mobile: @profile.mobile, pincode: @profile.pincode, street: @profile.street } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { building: @profile.building, city: @profile.city, dateOfBirth: @profile.dateOfBirth, email: @profile.email, firstName: @profile.firstName, idProof: @profile.idProof, lastName: @profile.lastName, member_id: @profile.member_id, mobile: @profile.mobile, pincode: @profile.pincode, street: @profile.street } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
