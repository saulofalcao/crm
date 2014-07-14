class AddBairroToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :bairro, :string
  end
end
