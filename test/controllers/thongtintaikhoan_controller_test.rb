require "test_helper"

class ThongtintaikhoanControllerTest < ActionDispatch::IntegrationTest
  test "should get thongtintaikhoan" do
    get thongtintaikhoan_thongtintaikhoan_url
    assert_response :success
  end
end
