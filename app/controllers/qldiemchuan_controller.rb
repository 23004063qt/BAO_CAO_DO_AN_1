class QldiemchuanController < ApplicationController

  require "roo"

  def qldiemchuan
    @dots = Dottuyensinh.all
    @diemchuans = Diemchuan.includes(:nganh, :dot, :phuongthuc)
  end

  def import_excel
    iddot = params[:iddot]

    import_file(params[:file_hocba], 1, iddot)
    import_file(params[:file_thpt], 2, iddot)
    import_file(params[:file_dgnl], 3, iddot)

    redirect_to "/qldiemchuan", notice: "Import điểm chuẩn thành công"
  end

  private

  def import_file(file, idphuongthuc, iddot)
    return if file.blank?

    xlsx = Roo::Excelx.new(file.path)

    xlsx.each_row_streaming(offset: 1) do |row|

      ten  = row[1]&.value
      diem = row[2]&.value

      next if ten.blank?

      # ép kiểu số (QUAN TRỌNG)
      diem = diem.to_f

      # tìm ngành theo tên
      nganh = Nganh.find_by(TENNGANH: ten)

      next if nganh.nil?

      record = Diemchuan.find_or_initialize_by(
        IDNGANH: nganh.IDNGANH,
        IDDOT: iddot,
        IDPHUONGTHUC: idphuongthuc
      )

      record.DIEM = diem
      record.save!
    end
  end
end