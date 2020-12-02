class CreateTripUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_users do |t|
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true
      t.timestamps
    end
  end
end
