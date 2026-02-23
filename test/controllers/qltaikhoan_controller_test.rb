require "test_helper"

class QltaikhoanControllerTest < ActionDispatch::IntegrationTest
  test "should get qltaikhoan" do
    get qltaikhoan_qltaikhoan_url
    assert_response :success
  end
end
