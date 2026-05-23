class DangnhapController < ApplicationController

  def dangnhap
  end

  def login
    # Tìm người dùng dựa trên tên đăng nhập và mật khẩu
    user = Nguoidung.find_by(
      USERNAME: params[:username],
      MATKHAU: params[:password]
    )

    if user
      # Lưu ID người dùng vào session
      session[:user_id] = user.IDNGUOIDUNG
     # Chuyển hướng đến trang chủ sau khi đăng nhập thành công
      redirect_to trangchu_index_path,
      notice: "Đăng nhập thành công"
    else
      # Hiển thị thông báo lỗi nếu đăng nhập không thành công bằng flash
      flash[:alert] = "Sai tài khoản hoặc mật khẩu"
      render :dangnhap
    end
  end
  # Đăng xuất người dùng
  def logout
    # Xóa ID người dùng khỏi session để đăng xuất
    session[:user_id] = nil

    redirect_to trangchu_index_path,
    notice: "Đã đăng xuất"
  end
end