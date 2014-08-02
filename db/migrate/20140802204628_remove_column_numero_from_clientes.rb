class RemoveColumnNumeroFromClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :numero, :string
  end
end
