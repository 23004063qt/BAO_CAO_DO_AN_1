require "test_helper"

class TintucControllerTest < ActionDispatch::IntegrationTest
  test "should get tintuc" do
    get tintuc_tintuc_url
    assert_response :success
  end
end
