class Thisinh < ApplicationRecord
  self.table_name = "THISINH"
  self.primary_key = "IDTHISINH"

  has_many :diemhocbas,
           class_name: "Diemhocba",
           foreign_key: "IDTHHISINH"

  has_many :hosodangkies,
           class_name: "Hosodangky",
           foreign_key: "IDTHISINH"
end