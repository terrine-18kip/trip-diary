class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.integer    :day_id, null: false
      t.references :trip,   foreign_key: true
      t.timestamps
    end
  end
end
