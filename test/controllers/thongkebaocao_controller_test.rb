require "test_helper"

class ThongkebaocaoControllerTest < ActionDispatch::IntegrationTest
  test "should get thongkebaocao" do
    get thongkebaocao_thongkebaocao_url
    assert_response :success
  end
end
