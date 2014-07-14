class RemoveEnderecoFromClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :endereco, :string
  end
end
