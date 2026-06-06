require "csv"

class ThongkebaocaoController < ApplicationController
  def thongkebaocao
    @tong = Hosodangky.count
    @dau = Hosodangky.where(KETQUA: "Đậu").count
    @rot = Hosodangky.where(KETQUA: "Không xét").count
    @ds_all = Hosodangky.includes(:thisinh)
  end

  def xuat_excel
    loai = params[:loai]

    @ds = case loai
          when "dau" then Hosodangky.where(KETQUA: "Đậu").includes(:thisinh)
          when "rot" then Hosodangky.where(KETQUA: "Không xét").includes(:thisinh)
          else            Hosodangky.includes(:thisinh)
          end

    ten_file = case loai
               when "dau" then "danh_sach_dau.csv"
               when "rot" then "danh_sach_khong_xet.csv"
               else            "tat_ca_ho_so.csv"
               end

    csv_data = CSV.generate(encoding: "UTF-8") do |csv|
      csv << ["STT", "Họ tên", "Ngày sinh", "CCCD", "SĐT", "Email", "Ngày nộp", "Kết quả"]
      @ds.each_with_index do |hoso, i|
        ts = hoso.thisinh
        csv << [
          i + 1,
          ts&.HOTENTS,
          ts&.NGAYSINH&.strftime("%d/%m/%Y"),
          ts&.SOCCCD,
          ts&.SDT,
          ts&.EMAIL,
          hoso.NGAYNOP&.strftime("%d/%m/%Y"),
          hoso.KETQUA
        ]
      end
    end

    send_data "\xEF\xBB\xBF" + csv_data,
      filename: ten_file,
      type: "text/csv; charset=utf-8",
      disposition: "attachment"
  end
end