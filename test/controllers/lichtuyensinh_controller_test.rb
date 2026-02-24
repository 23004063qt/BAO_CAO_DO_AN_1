require "test_helper"

class LichtuyensinhControllerTest < ActionDispatch::IntegrationTest
  test "should get lichtuyensinh" do
    get lichtuyensinh_lichtuyensinh_url
    assert_response :success
  end
end
