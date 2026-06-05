class TintucController < ApplicationController
  def tintuc
    @tin_noi_bat = Tintuc.order(NGAYDANG: :desc).first
    @tin_moi = Tintuc.order(NGAYDANG: :desc).offset(1)
  end
end