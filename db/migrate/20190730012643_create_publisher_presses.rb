class CreatePublisherPresses < ActiveRecord::Migration[5.2]
  def change
    create_table :publisher_presses do |t|
      t.references :publisher, foreign_key: true
      t.references :press, foreign_key: true
      t.integer :purchase_order
      t.integer :delivery_order
      t.integer :invoice

      t.timestamps
    end
  end
end
