class Phuongthucxettuyen < ApplicationRecord
  self.table_name = "PHUONGTHUCXETTUYEN"
  self.primary_key = "IDPHUONGTHUC"

  has_many :hosodangkies,
           foreign_key: "IDPHUONGTHUC"
end