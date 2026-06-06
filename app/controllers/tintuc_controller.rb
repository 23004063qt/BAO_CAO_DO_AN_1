class TintucController < ApplicationController
  def tintuc
  @tin_noi_bat = Tintuc.order(NGAYDANG: :desc).first
  @tintuc_list = Tintuc.order(NGAYDANG: :desc).where.not(IDTINTUC: @tin_noi_bat.IDTINTUC)
end
end