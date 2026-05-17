class NganhTohop < ApplicationRecord
  self.table_name = "NGANH_TOHOP"
  self.primary_key = "ID"

  belongs_to :nganh,
             class_name: "Nganh",
             foreign_key: "IDNGANH"

  belongs_to :tohopmon,
             class_name: "Tohopmon",
             foreign_key: "IDTOHOP"
end