class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :start_on
      t.date :end_on
      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
