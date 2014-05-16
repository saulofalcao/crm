class RemoveStartDateFromQuartos < ActiveRecord::Migration
  def change
    remove_column :quartos, :start_date, :date
  end
end
