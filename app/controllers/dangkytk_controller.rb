class DangkytkController < ApplicationController
  def dangkytk
  end
  
  
  def create
    #tạo 1 đố tượng mới từ model Nguoidung với các thuộc tính được lấy từ params
    nguoidung = Nguoidung.new(
      USERNAME: params[:tentk],
      EMAIL: params[:email],
      MATKHAU: params[:matkhau]
    )
    #lưu đối tượng vào cơ sở dữ liệu và kiểm tra kết quả
    if nguoidung.save
      redirect_to dangnhap_dangnhap_path,
      notice: "Đăng ký thành công"
    else
      flash[:alert] = "Đăng ký thất bại"
      render :dangkytk #hiển thị lại form đăng ký
    end
  end
end
