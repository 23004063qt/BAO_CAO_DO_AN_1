class Diemchuan < ApplicationRecord
  self.table_name = "DIEMCHUAN"
  self.primary_key = "IDDIEMCHUAN"

  belongs_to :dottuyensinh,
             foreign_key: "IDDOT"

  belongs_to :nganh,
             class_name: "Nganhdaotao",
             foreign_key: "IDNGANH"

  belongs_to :phuongthucxettuyen,
             foreign_key: "IDPHUONGTHUC"
end