class Hosodangky < ApplicationRecord
  self.table_name = "HOSODANGKY"
  self.primary_key = "IDHOSO"

  belongs_to :thisinh,
             class_name: "Thisinh",
             foreign_key: "IDTHISINH"
end