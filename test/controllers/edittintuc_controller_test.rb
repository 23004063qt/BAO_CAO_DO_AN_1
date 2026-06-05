require "test_helper"

class EdittintucControllerTest < ActionDispatch::IntegrationTest
  test "should get edittintuc" do
    get edittintuc_edittintuc_url
    assert_response :success
  end
end
