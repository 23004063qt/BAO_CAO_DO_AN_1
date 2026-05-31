class Diemthi < ApplicationRecord
  self.table_name = "DIEMTHI"
  self.primary_key = "IDDIEMTHI"

  belongs_to :thisinh,
             class_name: "Thisinh",
             foreign_key: "IDTHISINH"
end