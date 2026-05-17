class Tohopmon < ApplicationRecord
  self.table_name = "TOHOPMON"
  self.primary_key = "IDTOHOP"

  has_many :nganh_tohops,
           class_name: "NganhTohop",
           foreign_key: "IDTOHOP"

  has_many :nganhs,
           through: :nganh_tohops,
           source: :nganh
end