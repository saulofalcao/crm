class AddColumnTelefoneToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :telefone, :string
  end
end
