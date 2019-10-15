require 'test_helper'

class EndUser::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get end_user_end_users_top_url
    assert_response :success
  end

  test "should get edit" do
    get end_user_end_users_edit_url
    assert_response :success
  end

  test "should get show" do
    get end_user_end_users_show_url
    assert_response :success
  end

end
