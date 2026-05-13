class CreateTaikhoans < ActiveRecord::Migration[8.1]
  def change
    create_table :taikhoans do |t|
      t.timestamps
    end
  end
end
