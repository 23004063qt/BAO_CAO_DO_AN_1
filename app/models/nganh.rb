class Nganh < ApplicationRecord
  self.table_name = "NGANHDAOTAO"
  self.primary_key = "IDNGANH"

  has_many :nganh_tohops,
           class_name: "NganhTohop",
           foreign_key: "IDNGANH"

  has_many :tohopmons,
           through: :nganh_tohops,
           source: :tohopmon
end