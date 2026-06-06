class Tintuc < ApplicationRecord
  self.table_name = "TINTUC"
  self.primary_key = "IDTINTUC" 
  validates :TIEUDE, presence: true
end