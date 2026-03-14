require "test_helper"

class QlkhoaDvControllerTest < ActionDispatch::IntegrationTest
  test "should get qlkhoa_dv" do
    get qlkhoa_dv_qlkhoa_dv_url
    assert_response :success
  end
end
