class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string     :name,        null: false
      t.integer    :category_id, null: false
      t.time       :start_time
      t.time       :end_time
      t.integer    :fee
      t.string     :link
      t.text       :memo
      t.references :plan, foreign_key: true
      t.timestamps
    end
  end
end
