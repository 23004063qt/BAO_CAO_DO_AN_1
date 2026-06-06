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
  def edit
  @tin = Tintuc.find(params[:id])
end

def update
  @tin = Tintuc.find(params[:id])
  
  tin_params = tintuc_params.to_h

  # Xử lý upload ảnh đại diện
  if params[:anh_dai_dien_file].present?
    file = params[:anh_dai_dien_file]
    ten_file = "#{SecureRandom.hex(8)}#{File.extname(file.original_filename)}"
    duong_dan = Rails.root.join("public", "images", ten_file)
    File.binwrite(duong_dan, file.read)
    tin_params[:ANH_DAI_DIEN] = "/images/#{ten_file}"
  end

  # Xử lý upload ảnh bài viết
  if params[:anh_bai_viet_file].present?
    file = params[:anh_bai_viet_file]
    ten_file = "#{SecureRandom.hex(8)}#{File.extname(file.original_filename)}"
    duong_dan = Rails.root.join("public", "images", ten_file)
    File.binwrite(duong_dan, file.read)
    tin_params[:ANH_BAI_VIET] = "/images/#{ten_file}"
  end

  if @tin.update(tin_params)
    redirect_to qltintuc_qltintuc_path
  else
    render :edit
  end
end

private

def tintuc_params
  params.require(:tintuc).permit(:TIEUDE, :NOIDUNG, :NGAYDANG, :ANH_DAI_DIEN, :ANH_BAI_VIET, :TOM_TAT, :NOI_DUNG_THEM, :DANHMUC)
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