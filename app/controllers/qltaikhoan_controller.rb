class QltaikhoanController < ApplicationController
  def qltaikhoan
    @nguoidungs = Nguoidung.all
  end

  def delete
    
    user = Nguoidung.find(params[:id])

    if user.IDNGUOIDUNG == current_user.IDNGUOIDUNG
      redirect_to qltaikhoan_qltaikhoan_path,
      alert: "Không thể xóa tài khoản đang đăng nhập"
      return
    end

    user.destroy
    redirect_to qltaikhoan_qltaikhoan_path,
    notice: "Xóa tài khoản thành công"

  end

  def edit
    @user = Nguoidung.find(params[:id])
  end


  def update

      user = Nguoidung.find(params[:id])

      user.update(
          USERNAME: params[:USERNAME],
          EMAIL: params[:EMAIL],
          VAITRO: params[:VAITRO]
      )

      redirect_to qltaikhoan_qltaikhoan_path

  end
end