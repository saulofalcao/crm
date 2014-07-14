class RemoveServicoFromClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :servico_id
  end
end
