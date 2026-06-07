class QlnganhController < ApplicationController
  # Danh sách ngành (Admin)
  def qlnganh
    @nganhs = Nganh.all.order(:TENNGANH)
  end

  # Form thêm ngành
  def new
    @nganh = Nganh.new
    @khoas = Khoa.all
  end

  # Lưu thêm
  def create
    @nganh = Nganh.new(nganh_params)

    if @nganh.save
      redirect_to qlnganh_qlnganh_path, notice: "Thêm ngành thành công!"
    else
      @khoas = Khoa.all
      render :new
    end
  end

  # Form sửa
  def edit
    @nganh = Nganh.find(params[:id])
    @khoas = Khoa.all
  end

  # Cập nhật
  def update
    @nganh = Nganh.find(params[:id])

    if @nganh.update(nganh_params)
      redirect_to qlnganh_qlnganh_path, notice: "Cập nhật ngành thành công!"
    else
      @khoas = Khoa.all
      render :edit
    end
  end

  # Xóa
  def delete
    @nganh = Nganh.find(params[:id])
    @nganh.destroy

    redirect_to qlnganh_qlnganh_path, notice: "Xóa ngành thành công!"
  end

  private

  def nganh_params
    params.require(:nganh).permit(:TENNGANH, :MOTA, :IDKHOA, :HOC_PHI, :CHI_TIEU)
  end
end
