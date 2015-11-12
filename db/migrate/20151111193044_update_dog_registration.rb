class UpdateDogRegistration < ActiveRecord::Migration
  def change
    add_column :dogs, :registered_at, :date
    add_column :dogs, :registered_until, :date

    add_column :dogs, :period, :integer

    add_reference :dogs, :owner, index: true, foreign_key: true
  end
end
