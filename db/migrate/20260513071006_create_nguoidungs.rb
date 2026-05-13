class CreateNguoidungs < ActiveRecord::Migration[8.1]
  def change
    create_table :nguoidungs do |t|
      t.timestamps
    end
  end
end
