class Tintuc < ApplicationRecord
  ANH_TIN_TUC_MAC_DINH = "ts.jpg"

  self.table_name = "TINTUC"
  self.primary_key = "IDTINTUC" 
  validates :TIEUDE, presence: true

  def danh_muc_hien_thi
    danh_muc = self[:DANHMUC]

    {
      "Tin t?c" => "Tin tức",
      "Tuy?n sinh" => "Tuyển sinh",
      "Thong bao" => "Thông báo",
      "Th?ng b?o" => "Thông báo"
    }.fetch(danh_muc.to_s, danh_muc)
  end

  def anh_dai_dien_hien_thi
    self[:ANH_DAI_DIEN].presence || ANH_TIN_TUC_MAC_DINH
  end
end
