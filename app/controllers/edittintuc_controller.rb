class EdittintucController < ApplicationController
  def edittintuc
    @id = params[:id]

    if @id.present?
      @tintuc = ActiveRecord::Base.connection.execute(
        "SELECT * FROM TINTUC WHERE ID = #{ActiveRecord::Base.connection.quote(@id.to_i)}"
      ).first

      @danhmuc_list = ActiveRecord::Base.connection.execute("SELECT * FROM DANHMUC ORDER BY TEN_DANHMUC")
    end

    if request.post?
      tieude        = params[:TIEUDE]
      noidung       = params[:NOIDUNG]
      ngaydang      = params[:NGAYDANG]
      tom_tat       = params[:TOM_TAT]
      noi_dung_them = params[:NOI_DUNG_THEM]
      danhmuc       = params[:DANHMUC]

      anh_dai_dien = @tintuc ? @tintuc["ANH_DAI_DIEN"] : nil
      anh_bai_viet = @tintuc ? @tintuc["ANH_BAI_VIET"] : nil

      if params[:ANH_DAI_DIEN].present? && params[:ANH_DAI_DIEN].respond_to?(:original_filename)
        upload = params[:ANH_DAI_DIEN]
        filename = "#{SecureRandom.hex(8)}_#{upload.original_filename.gsub(/\s+/, '_')}"
        path = Rails.root.join("public", "uploads", "tintuc", filename)
        FileUtils.mkdir_p(File.dirname(path))
        File.open(path, "wb") { |f| f.write(upload.read) }
        anh_dai_dien = "/uploads/tintuc/#{filename}"
      end

      if params[:ANH_BAI_VIET].present? && params[:ANH_BAI_VIET].respond_to?(:original_filename)
        upload = params[:ANH_BAI_VIET]
        filename = "#{SecureRandom.hex(8)}_#{upload.original_filename.gsub(/\s+/, '_')}"
        path = Rails.root.join("public", "uploads", "tintuc", filename)
        FileUtils.mkdir_p(File.dirname(path))
        File.open(path, "wb") { |f| f.write(upload.read) }
        anh_bai_viet = "/uploads/tintuc/#{filename}"
      end

      sql = <<~SQL
        UPDATE TINTUC SET
          TIEUDE        = #{ActiveRecord::Base.connection.quote(tieude)},
          NOIDUNG       = #{ActiveRecord::Base.connection.quote(noidung)},
          NGAYDANG      = #{ActiveRecord::Base.connection.quote(ngaydang)},
          ANH_DAI_DIEN  = #{ActiveRecord::Base.connection.quote(anh_dai_dien)},
          ANH_BAI_VIET  = #{ActiveRecord::Base.connection.quote(anh_bai_viet)},
          TOM_TAT       = #{ActiveRecord::Base.connection.quote(tom_tat)},
          NOI_DUNG_THEM = #{ActiveRecord::Base.connection.quote(noi_dung_them)},
          DANHMUC       = #{ActiveRecord::Base.connection.quote(danhmuc)}
        WHERE ID = #{@id.to_i}
      SQL

      ActiveRecord::Base.connection.execute(sql)
      flash[:notice] = "Cập nhật tin tức thành công!"
      redirect_to edittintuc_edittintuc_path(id: @id)
    end
  end
end