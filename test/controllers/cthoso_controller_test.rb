require "test_helper"

class CthosoControllerTest < ActionDispatch::IntegrationTest
  test "should get cthoso" do
    get cthoso_cthoso_url
    assert_response :success
  end
end
