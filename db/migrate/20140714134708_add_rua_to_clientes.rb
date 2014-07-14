class AddRuaToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :rua, :string
  end
end
