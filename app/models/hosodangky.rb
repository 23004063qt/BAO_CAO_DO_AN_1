class Hosodangky < ApplicationRecord
  self.table_name = "HOSODANGKY"
  self.primary_key = "IDHOSO"

  belongs_to :thisinh,
             class_name: "Thisinh",
             foreign_key: "IDTHISINH"

  belongs_to :phuongthucxettuyen,
             class_name: "Phuongthucxettuyen",
             foreign_key: "IDPHUONGTHUC",
             optional: true

  belongs_to :nganh,
             class_name: "Nganh",
             foreign_key: "IDNGANH",
             optional: true

  self.table_name = "HOSODANGKY"
  self.primary_key = "IDHOSO"
  belongs_to :thisinh, foreign_key: "IDTHISINH"

end