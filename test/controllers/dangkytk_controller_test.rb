require "test_helper"

class DangkytkControllerTest < ActionDispatch::IntegrationTest
  test "should get dangkytk" do
    get dangkytk_dangkytk_url
    assert_response :success
  end
end
