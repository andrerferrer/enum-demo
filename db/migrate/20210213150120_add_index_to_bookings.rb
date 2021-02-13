class AddIndexToBookings < ActiveRecord::Migration[6.0]
  def change
    add_index :bookings, :status
  end
end
