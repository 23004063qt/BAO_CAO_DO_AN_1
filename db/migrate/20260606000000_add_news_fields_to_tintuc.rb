class AddNewsFieldsToTintuc < ActiveRecord::Migration[8.1]
  def change
    add_column :TINTUC, :ANH_DAI_DIEN, :string, limit: 500 unless column_exists?(:TINTUC, :ANH_DAI_DIEN)
    add_column :TINTUC, :ANH_BAI_VIET, :string, limit: 500 unless column_exists?(:TINTUC, :ANH_BAI_VIET)
    add_column :TINTUC, :TOM_TAT, :text unless column_exists?(:TINTUC, :TOM_TAT)
    add_column :TINTUC, :NOI_DUNG_THEM, :text unless column_exists?(:TINTUC, :NOI_DUNG_THEM)
    add_column :TINTUC, :DANHMUC, :string, limit: 100, default: "Tin tức" unless column_exists?(:TINTUC, :DANHMUC)
  end
end
