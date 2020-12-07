class RenameDayIdColumnToDaily < ActiveRecord::Migration[6.0]
  def change
    rename_column :plans, :day_id, :daily
  end
end
