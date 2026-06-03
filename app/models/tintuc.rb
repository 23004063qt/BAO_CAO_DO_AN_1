class Tintuc < ApplicationRecord
  self.table_name = "TINTUC"

  validates :TIEUDE, presence: true
end