class NophosoController < ApplicationController

  def nophoso
  end

  def xac_thuc_cccd

    file = params[:filecccdt]

    if file.nil?
      render json: {
        success: false,
        message: "Không có file"
      }
      return
    end

    filepath = Rails.root.join(
      "ai-service",
      "uploads",
      file.original_filename
    )

    # tạo thư mục nếu chưa có
    FileUtils.mkdir_p(
      Rails.root.join("ai-service", "uploads")
    )

    # lưu file
    File.open(filepath, "wb") do |f|
      f.write(file.read)
    end

    # chạy AI
    result = `python ai-service/detect.py "#{filepath}"`

    puts result

    render json: JSON.parse(result)

  end

end