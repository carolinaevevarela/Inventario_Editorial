class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.references :bookstore, foreign_key: true
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
