class CreateRegistrationPeriods < ActiveRecord::Migration
  def change
    create_table :registration_periods do |t|
      t.integer :length
      t.string :cost

      t.timestamps null: false
    end
  end
end
