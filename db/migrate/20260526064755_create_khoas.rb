class CreateKhoas < ActiveRecord::Migration[8.1]
  def change
    create_table :khoas do |t|
      t.timestamps
    end
  end
end
