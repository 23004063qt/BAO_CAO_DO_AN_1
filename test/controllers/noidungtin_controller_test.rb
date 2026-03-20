require "test_helper"

class NoidungtinControllerTest < ActionDispatch::IntegrationTest
  test "should get noidungtin" do
    get noidungtin_noidungtin_url
    assert_response :success
  end
end
