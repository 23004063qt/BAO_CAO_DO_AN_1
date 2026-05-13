class QltaikhoanController < ApplicationController
  def qltaikhoan
    @nguoidungs = Nguoidung.all
  end
end