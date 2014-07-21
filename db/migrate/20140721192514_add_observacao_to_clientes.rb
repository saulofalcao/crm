class AddObservacaoToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :observacao, :text
  end
end
