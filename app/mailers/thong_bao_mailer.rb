class ThongBaoMailer < ApplicationMailer

  default from: "lehuynhanhduy28@gmail.com"

  def trung_tuyen(thisinh, nganh)
    @thisinh = thisinh
    @nganh = nganh

    mail(
      to: @thisinh.EMAIL,
      subject: "Thông báo kết quả tuyển sinh"
    )
  end

  def khong_trung_tuyen(thisinh, nganh)
    @thisinh = thisinh
    @nganh = nganh

    mail(
      to: @thisinh.EMAIL,
      subject: "Thông báo kết quả tuyển sinh"
    )
  end

end