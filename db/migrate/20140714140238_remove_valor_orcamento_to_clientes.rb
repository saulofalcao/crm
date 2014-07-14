class RemoveValorOrcamentoToClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :valor_orcamento, :float
  end
end
