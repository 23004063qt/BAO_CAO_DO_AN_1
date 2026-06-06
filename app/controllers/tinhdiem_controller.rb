class TinhdiemController < ApplicationController

  def tinh

    diem = params[:diem]

    map_mon = {
      "Toán" => "toan",
      "Văn" => "van",
      "Tiếng Anh" => "anh",
      "Lý" => "ly",
      "Hóa" => "hoa",
      "Sinh" => "sinh",
      "Sử" => "su",
      "Địa" => "dia",
      "Tin học" => "tin",
      "GDKT và PL" => "gdkt",
      "GDCD" => "gdcd",
      "Công nghệ công nghiệp" => "cn",
      "Công nghệ nông nghiệp" => "cnn"
    }

    # =====================
    # TÍNH ĐIỂM TB TỪ 6 HK
    # =====================

    diem_tb = {}

    map_mon.each do |ten_mon, ma_mon|

      tong = 0
      dem = 0

      [10,11,12].each do |lop|
        [1,2].each do |hk|

          key = "l#{lop}hk#{hk}-#{ma_mon}"

          if diem[key].present?

            tong += diem[key].to_f
            dem += 1

          end
        end
      end

      diem_tb[ten_mon] =
        dem > 0 ? (tong / dem).round(2) : 0

    end

    # =====================
    # TÍNH ĐIỂM TỔ HỢP
    # =====================

    ketqua = []

    Tohopmon.order(:TENTOHOP).each do |th|

      diem1 = diem_tb[th.MON1] || 0
      diem2 = diem_tb[th.MON2] || 0
      diem3 = diem_tb[th.MON3] || 0

      tong = (
        diem1 +
        diem2 +
        diem3
      ).round(2)

      ketqua << {

        tohop: th.TENTOHOP,

        mon1: th.MON1,
        mon2: th.MON2,
        mon3: th.MON3,

        diem1: diem1,
        diem2: diem2,
        diem3: diem3,

        tong: tong
      }
    end

    render json: ketqua

  end

end