require "test_helper"

class OccupantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get occupants_index_url
    assert_response :success
  end
end
