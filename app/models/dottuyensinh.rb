class Dottuyensinh < ApplicationRecord
  self.table_name = "DOTTUYENSINH"
  self.primary_key = "IDDOT"

  has_many :diemchuans,
           foreign_key: "IDDOT",
           dependent: :destroy
end