require "test_helper"

class ThemtintucControllerTest < ActionDispatch::IntegrationTest
  test "should get themtintuc" do
    get themtintuc_themtintuc_url
    assert_response :success
  end
end
