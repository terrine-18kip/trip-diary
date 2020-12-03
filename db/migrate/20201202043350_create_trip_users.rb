class CreateTripUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_users do |t|
      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
