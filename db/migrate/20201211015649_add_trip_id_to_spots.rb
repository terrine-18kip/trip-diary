class AddTripIdToSpots < ActiveRecord::Migration[6.0]
  def change
    add_reference :spots, :trip, foreign_key: true
  end
end
