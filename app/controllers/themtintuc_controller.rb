class ThemtintucController < ApplicationController

  def new
    @tintuc = Tintuc.new
  end

  def create
    @tintuc = Tintuc.new(tintuc_params)
    @tintuc.NGAYDANG = Time.now

    # Upload ảnh đại diện
    if params[:ANH_DAI_DIEN].present?
      file = params[:ANH_DAI_DIEN]
      filename = SecureRandom.hex(8) + File.extname(file.original_filename)
      path = Rails.root.join('public', 'images', filename)  
      File.open(path, 'wb') { |f| f.write(file.read) }
      @tintuc.ANH_DAI_DIEN = "/images/#{filename}"           
    end

    # Upload ảnh bài viết
    if params[:ANH_BAI_VIET].present?
      urls = params[:ANH_BAI_VIET].map do |file|
        filename = SecureRandom.hex(8) + File.extname(file.original_filename)
        path = Rails.root.join('public', 'images', filename) 
        File.open(path, 'wb') { |f| f.write(file.read) }
        "/images/#{filename}"                                  
      end
      @tintuc.ANH_BAI_VIET = urls.to_json
    end

    if @tintuc.save
      redirect_to root_path, notice: "Đăng bài thành công!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tintuc_params
    params.permit(:TIEUDE, :NOIDUNG, :TOM_TAT, :NOI_DUNG_THEM, :DANHMUC)
  end

end