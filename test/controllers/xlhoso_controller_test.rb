require "test_helper"

class XlhosoControllerTest < ActionDispatch::IntegrationTest
  test "should get xlhoso" do
    get xlhoso_xlhoso_url
    assert_response :success
  end
end
