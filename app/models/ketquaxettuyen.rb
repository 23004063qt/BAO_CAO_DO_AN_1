class Ketquaxettuyen < ApplicationRecord
  self.table_name = "KETQUAXETTUYEN"
  self.primary_key = "IDKETQUA"

  belongs_to :hosodangky,
             class_name: "Hosodangky",
             foreign_key: "IDHOSO"
end