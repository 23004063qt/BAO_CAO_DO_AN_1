require "test_helper"

class NganhControllerTest < ActionDispatch::IntegrationTest
  test "should get nganh" do
    get nganh_nganh_url
    assert_response :success
  end
end
