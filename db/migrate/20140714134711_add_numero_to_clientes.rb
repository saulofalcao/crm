class AddNumeroToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :numero, :string
  end
end
