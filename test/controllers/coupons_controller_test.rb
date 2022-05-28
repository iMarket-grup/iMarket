require "test_helper"

class CouponsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coupons_index_url
    assert_response :success
  end

  test "should get show" do
    get coupons_show_url
    assert_response :success
  end

  test "should get new" do
    get coupons_new_url
    assert_response :success
  end
end
