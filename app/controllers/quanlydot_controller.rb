class QuanlydotController < ApplicationController

  def dottuyensinh
    @dots = Dottuyensinh.order(IDDOT: :desc)
  end

  def new
    @dot = Dottuyensinh.new
  end

  def create
  @dot = Dottuyensinh.new(
    TENDOT: params[:dottuyensinh][:TENDOT],
    NGAYBATDAU: params[:dottuyensinh][:NGAYBATDAU],
    NGAYKETTHUC: params[:dottuyensinh][:NGAYKETTHUC],
    NOIDUNG: params[:dottuyensinh][:NOIDUNG]
  )

  if @dot.save
    redirect_to "/quanlydot",
    notice: "Thêm đợt tuyển sinh thành công"
  else
    render :new,
    status: :unprocessable_entity
  end
end

   def edit
    @dot = Dottuyensinh.find(params[:id])
  end

  def update
    @dot = Dottuyensinh.find(params[:id])

    if @dot.update(dot_params)
      redirect_to "/quanlydot",
                  notice: "Cập nhật thành công"
    else
      render :edit
    end
  end

  def destroy
    @dot = Dottuyensinh.find(params[:id])

    @dot.destroy

    redirect_to "/quanlydot",
                notice: "Xóa đợt tuyển sinh thành công"
  end

  private

  def dot_params
  params.require(:dottuyensinh).permit(
    :TENDOT,
    :NGAYBATDAU,
    :NGAYKETTHUC,
    :NOIDUNG
  )
end

end