class TracuuhsController < ApplicationController
  def tracuuhs
  end

  def ketqua
    cccd = params[:cccd].to_s.strip
    @thisinh = Thisinh.find_by(SOCCCD: cccd)
    if @thisinh
      @hoso_list = Hosodangky.where(IDTHISINH: @thisinh.IDTHISINH).includes(:thisinh)
    else
      @khong_tim_thay = true
    end
    render :tracuuhs
  end
end