class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.date :date_of_birth

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
