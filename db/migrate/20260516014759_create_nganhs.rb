class CreateNganhs < ActiveRecord::Migration[8.1]
  def change
    create_table :nganhs do |t|
      t.string :tennganh

      t.timestamps
    end
  end
end
