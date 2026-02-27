require "test_helper"

class ThongtintruongControllerTest < ActionDispatch::IntegrationTest
  test "should get thongtintruong" do
    get thongtintruong_thongtintruong_url
    assert_response :success
  end
end
