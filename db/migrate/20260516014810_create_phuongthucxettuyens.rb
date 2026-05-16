class CreatePhuongthucxettuyens < ActiveRecord::Migration[8.1]
  def change
    create_table :phuongthucxettuyens do |t|
      t.string :tenphuongthuc

      t.timestamps
    end
  end
end
