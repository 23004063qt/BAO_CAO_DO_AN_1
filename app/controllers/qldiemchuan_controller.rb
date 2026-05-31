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

  def cong_bo

    Thisinh.find_each do |thisinh|

      nguyenvongs = Hosodangky
                      .includes(:nganh)
                      .where(
                        IDTHISINH: thisinh.IDTHISINH,
                        IDPHUONGTHUC: 1,
                        TRANGTHAI: "Đã duyệt"
                      )
                      .order(:THUTU)

      next if nguyenvongs.empty?

      da_trung_tuyen = false

      nguyenvongs.each do |hoso|

        dc = Diemchuan.find_by(
          IDNGANH: hoso.IDNGANH,
          IDDOT: hoso.IDDOT,
          IDPHUONGTHUC: 1
        )

        next if dc.nil?

      ket_qua = tinh_diem_xet(hoso)

      diem_xet = ket_qua[:diem]
      tohop_xet = ket_qua[:tohop]

      if diem_xet >= dc.DIEM

          nguyenvongs.each do |nv|

            if nv.IDHOSO == hoso.IDHOSO
              nv.update!(KETQUA: "Đậu")

            elsif nv.THUTU < hoso.THUTU
              nv.update!(KETQUA: "Rớt")

            else
              nv.update!(KETQUA: "Không xét")
            end

          end

          Ketquaxettuyen.find_or_create_by!(
            IDHOSO: hoso.IDHOSO
          ) do |kq|
            kq.KETQUA = "Đậu"
            kq.DIEMXET = diem_xet
            kq.DIEMCHUAN = dc.DIEM
          end

          ThongBaoMailer
            .trung_tuyen(
              thisinh,
              hoso.nganh
            )
            .deliver_now

          da_trung_tuyen = true

          break

        end

      end

      next if da_trung_tuyen

      nguyenvongs.each do |hoso|
        hoso.update!(KETQUA: "Rớt")
      end

      ThongBaoMailer
        .khong_trung_tuyen(
          thisinh,
          nguyenvongs.first.nganh
        )
        .deliver_now

    end

    redirect_to "/qldiemchuan",
                notice: "Đã công bố kết quả"

  end

  private

  def tinh_diem_xet(ho_so)

    diem_mon = Diemhocba
                .where(IDTHISINH: ho_so.IDTHISINH)
                .index_by(&:MON)

    to_hops = NganhTohop
                .where(IDNGANH: ho_so.IDNGANH)

    diem_cao_nhat = 0
    tohop_tot_nhat = nil

    to_hops.each do |nt|

      tohop = Tohopmon.find(nt.IDTOHOP)

      tong = 0

      [tohop.MON1, tohop.MON2, tohop.MON3].each do |mon|

        diem = diem_mon[mon]

        tong += diem.DIEM.to_f if diem

      end

      if tong > diem_cao_nhat
        diem_cao_nhat = tong
        tohop_tot_nhat = tohop.TENTOHOP
      end

    end

    {
      diem: diem_cao_nhat,
      tohop: tohop_tot_nhat
    }

  end
    
end