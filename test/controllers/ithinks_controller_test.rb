require "test_helper"

class IthinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ithinks_index_url
    assert_response :success
  end
end
