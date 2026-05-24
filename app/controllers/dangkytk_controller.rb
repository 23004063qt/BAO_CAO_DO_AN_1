class DangkytkController < ApplicationController
  def dangkytk
  end

  def create

    # Mặc định là THISINH
    vaitro = "THISINH"

    # Nếu người tạo là ADMIN
    if current_user && current_user.VAITRO == "ADMIN"
      vaitro = "ADMIN"
    end

    # Tạo tài khoản mới
    nguoidung = Nguoidung.new(
      USERNAME: params[:tentk],
      EMAIL: params[:email],
      MATKHAU: params[:matkhau],
      VAITRO: vaitro
    )

    # Lưu vào CSDL
    if nguoidung.save

      # Nếu ADMIN đang tạo tài khoản
      if current_user && current_user.VAITRO == "ADMIN"

        redirect_to qltaikhoan_qltaikhoan_path,
        notice: "Thêm tài khoản thành công"

      else

        # Người dùng tự đăng ký
        redirect_to dangnhap_dangnhap_path,
        notice: "Đăng ký thành công"

      end

    else

      flash[:alert] = "Đăng ký thất bại"
      render :dangkytk

    end
  end
end