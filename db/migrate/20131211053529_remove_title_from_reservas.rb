class RemoveTitleFromReservas < ActiveRecord::Migration
  def change
    remove_column :reservas, :title, :string
  end
end
