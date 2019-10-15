require 'test_helper'

class EndUser::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_products_index_url
    assert_response :success
  end

  test "should get show" do
    get end_user_products_show_url
    assert_response :success
  end

  test "should get search" do
    get end_user_products_search_url
    assert_response :success
  end

end
