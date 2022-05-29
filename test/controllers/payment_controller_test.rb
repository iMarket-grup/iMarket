require "test_helper"

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_index_url
    assert_response :success
  end

  test "should get success" do
    get payment_success_url
    assert_response :success
  end

  test "should get fail" do
    get payment_fail_url
    assert_response :success
  end
end
