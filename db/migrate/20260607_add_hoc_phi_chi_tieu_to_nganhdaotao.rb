class AddHocPhiChiTieuToNganhdaotao < ActiveRecord::Migration[8.1]
  def up
    # Use raw SQL to match exact table name in schema
    execute <<-SQL
      ALTER TABLE NGANHDAOTAO
      ADD COLUMN HOC_PHI bigint DEFAULT NULL,
      ADD COLUMN CHI_TIEU int DEFAULT NULL;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE NGANHDAOTAO
      DROP COLUMN IF EXISTS HOC_PHI,
      DROP COLUMN IF EXISTS CHI_TIEU;
    SQL
  end
end
