class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title,     null: false
      t.date   :start_date
      t.date   :end_date
      t.text   :memo
      t.timestamps
    end
  end
end
