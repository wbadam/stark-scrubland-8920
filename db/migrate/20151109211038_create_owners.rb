class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.text :postal_address
      t.string :email

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def up
    add_reference :dogs, :owners, index: true
    add_foreign_key :dogs, :owners
  end
end
