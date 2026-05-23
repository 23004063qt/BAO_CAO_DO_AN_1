class Diemhocba < ApplicationRecord
  self.table_name = "DIEMHOCBA"
  self.primary_key = "IDDIEMHOCBA"

  belongs_to :thisinh,
             class_name: "Thisinh",
             foreign_key: "IDTHISINH"
end