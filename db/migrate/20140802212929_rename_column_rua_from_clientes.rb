class RenameColumnRuaFromClientes < ActiveRecord::Migration
  def change
  	rename_column	:clientes, :rua, :endereco
  end
end
