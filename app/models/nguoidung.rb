class Nguoidung < ApplicationRecord
  self.table_name = "NGUOIDUNG"
  self.primary_key = "IDNGUOIDUNG"

  has_one :thisinh,
  foreign_key: "IDNGUOIDUNG",
  dependent: :destroy
end
