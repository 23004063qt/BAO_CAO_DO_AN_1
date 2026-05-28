class CthosoController < ApplicationController

  def cthoso

  @thisinh = Thisinh.find(params[:id])

  @nguyenvongs = Hosodangky
                   .includes(
                     :nganh,
                     :phuongthucxettuyen
                   )
                   .where(
                     IDTHISINH: @thisinh.IDTHISINH
                   )
                   .order(:THUTU)

  @hoso = @nguyenvongs.first

end

  def duyet

    thisinh = Thisinh.find(params[:id])

    Hosodangky.where(
      IDTHISINH: thisinh.IDTHISINH
    ).update_all(
      TRANGTHAI: "Đã duyệt"
    )

    redirect_to xlhoso_xlhoso_path,
                notice: "Đã duyệt toàn bộ nguyện vọng"

  end
  def tuchoi

    thisinh = Thisinh.find(params[:id])

    Hosodangky.where(
      IDTHISINH: thisinh.IDTHISINH
    ).update_all(
      TRANGTHAI: "Từ chối"
    )

    redirect_to xlhoso_xlhoso_path,
                notice: "Đã từ chối toàn bộ nguyện vọng"

  end

end