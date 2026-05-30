class LichtuyensinhController < ApplicationController
  def lichtuyensinh
    @dot_tuyen_sinh = Dottuyensinh.order(:NGAYBATDAU)
  end
end