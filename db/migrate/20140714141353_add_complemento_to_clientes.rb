class AddComplementoToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :complemento, :string
  end
end
