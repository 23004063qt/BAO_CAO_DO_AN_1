class TintucController < ApplicationController
  def tintuc
    @tin_noi_bat = Tintuc.order(NGAYDANG: :desc).first
    @tintuc_list = Tintuc.order(NGAYDANG: :desc)
    @tintuc_list = @tintuc_list.where.not(IDTINTUC: @tin_noi_bat.IDTINTUC) if @tin_noi_bat
    @danhmuc_list = Tintuc.all.map(&:danh_muc_hien_thi).compact.uniq
  end
end
