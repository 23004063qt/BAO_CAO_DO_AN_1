require "test_helper"

class QltintucControllerTest < ActionDispatch::IntegrationTest
  test "should get qltintuc" do
    get qltintuc_qltintuc_url
    assert_response :success
  end
end
