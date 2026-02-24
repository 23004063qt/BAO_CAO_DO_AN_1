require "test_helper"

class TinhdiemControllerTest < ActionDispatch::IntegrationTest
  test "should get tinhdiem" do
    get tinhdiem_tinhdiem_url
    assert_response :success
  end
end
