class Diemchuan < ApplicationRecord
  self.table_name = "DIEMCHUAN"
  self.primary_key = "IDDIEMCHUAN"

  belongs_to :nganh,
             class_name: "Nganh",
             foreign_key: "IDNGANH"

  belongs_to :dot,
             class_name: "Dottuyensinh",
             foreign_key: "IDDOT"

  belongs_to :phuongthuc,
             class_name: "Phuongthucxettuyen",
             foreign_key: "IDPHUONGTHUC"
end