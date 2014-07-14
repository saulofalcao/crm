class AddValorOrcamentoToServicos < ActiveRecord::Migration
  def change
    add_column :servicos, :valor_orcamento, :float
  end
end
