class AddClienteIdToOportunidades < ActiveRecord::Migration
  def change
    add_column :oportunidades, :cliente_id, :integer
  end
end
