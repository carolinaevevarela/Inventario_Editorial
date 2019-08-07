class CreatePresses < ActiveRecord::Migration[5.2]
  def change
    create_table :presses do |t|
      t.string :name
      t.string :rut
      t.string :address

      t.timestamps
    end
  end
end
