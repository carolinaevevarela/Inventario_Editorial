class CreatePublisherBookstores < ActiveRecord::Migration[5.2]
  def change
    create_table :publisher_bookstores do |t|
      t.references :publisher, foreign_key: true
      t.references :bookstore, foreign_key: true
      t.string :books
      t.integer :guide_office
      t.integer :quantity
      t.integer :net_price

      t.timestamps
    end
  end
end
