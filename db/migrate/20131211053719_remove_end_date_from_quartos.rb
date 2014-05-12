class RemoveEndDateFromQuartos < ActiveRecord::Migration
  def change
    remove_column :quartos, :end_date, :date
  end
end
