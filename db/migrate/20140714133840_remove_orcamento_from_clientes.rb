class RemoveOrcamentoFromClientes < ActiveRecord::Migration
  def change
  	remove_column :clientes, :orcamento
  end
end
