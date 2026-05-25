class CreateDottuyensinhs < ActiveRecord::Migration[8.1]
  def change
    create_table :dottuyensinhs do |t|
      t.timestamps
    end
  end
end
