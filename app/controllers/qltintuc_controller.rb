class QltintucController < ApplicationController
  def qltintuc
    @tintuc_list = Tintuc.all
  end

  def edit
    @tin = Tintuc.find(params[:id])
  end

  def update
    @tin = Tintuc.find(params[:id])
    if @tin.update(tintuc_params)
      redirect_to qltintuc_qltintuc_path
    else
      render :edit
    end
  end

  def xoa
    @tin = Tintuc.find(params[:id])
    @tin.destroy
    redirect_to qltintuc_qltintuc_path
  end

  private

  def tintuc_params
    params.require(:tintuc).permit(:TIEUDE, :ANH_DAI_DIEN, :TOM_TAT, :DANHMUC, :NGAYDANG)
  end
end