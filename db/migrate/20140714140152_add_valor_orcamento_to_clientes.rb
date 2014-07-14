class AddValorOrcamentoToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :valor_orcamento, :float
  end
end
