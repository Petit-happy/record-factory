require 'test_helper'

class EndUser::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get end_user_orders_show_url
    assert_response :success
  end

  test "should get order_check" do
    get end_user_orders_order_check_url
    assert_response :success
  end

  test "should get confirmation" do
    get end_user_orders_confirmation_url
    assert_response :success
  end

end
