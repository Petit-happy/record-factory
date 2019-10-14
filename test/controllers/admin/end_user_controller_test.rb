require 'test_helper'

class Admin::EndUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_end_user_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_end_user_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_end_user_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_end_user_destroy_url
    assert_response :success
  end

  test "should get update" do
    get admin_end_user_update_url
    assert_response :success
  end

end
