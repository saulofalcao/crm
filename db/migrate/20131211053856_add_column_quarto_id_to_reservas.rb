class AddColumnQuartoIdToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :quarto_id, :integer
  end
end
