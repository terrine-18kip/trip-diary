class AddRowOrderToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :row_order, :integer
  end
end
