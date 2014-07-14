class AddClienteIdToServicos < ActiveRecord::Migration
  def change
    add_column :servicos, :cliente_id, :integer
  end
end
