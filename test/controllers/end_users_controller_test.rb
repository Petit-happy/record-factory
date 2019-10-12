require 'test_helper'

class EndUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @end_user = end_users(:one)
  end

  test "should get index" do
    get end_users_url
    assert_response :success
  end

  test "should get new" do
    get new_end_user_url
    assert_response :success
  end

  test "should create end_user" do
    assert_difference('EndUser.count') do
      post end_users_url, params: { end_user: { address: @end_user.address, email: @end_user.email, family_name_kana: @end_user.family_name_kana, family_name_kanji: @end_user.family_name_kanji, given_name_kana: @end_user.given_name_kana, given_name_kanji: @end_user.given_name_kanji, is_deleted: @end_user.is_deleted, password: @end_user.password, phone_number: @end_user.phone_number, post_code: @end_user.post_code } }
    end

    assert_redirected_to end_user_url(EndUser.last)
  end

  test "should show end_user" do
    get end_user_url(@end_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_end_user_url(@end_user)
    assert_response :success
  end

  test "should update end_user" do
    patch end_user_url(@end_user), params: { end_user: { address: @end_user.address, email: @end_user.email, family_name_kana: @end_user.family_name_kana, family_name_kanji: @end_user.family_name_kanji, given_name_kana: @end_user.given_name_kana, given_name_kanji: @end_user.given_name_kanji, is_deleted: @end_user.is_deleted, password: @end_user.password, phone_number: @end_user.phone_number, post_code: @end_user.post_code } }
    assert_redirected_to end_user_url(@end_user)
  end

  test "should destroy end_user" do
    assert_difference('EndUser.count', -1) do
      delete end_user_url(@end_user)
    end

    assert_redirected_to end_users_url
  end
end
