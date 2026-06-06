require "test_helper"

class TracuuhsControllerTest < ActionDispatch::IntegrationTest
  test "should get tracuuhs" do
    get tracuuhs_tracuuhs_url
    assert_response :success
  end
end
